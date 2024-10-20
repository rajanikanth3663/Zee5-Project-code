resource "azurerm_user_assigned_identity" "aks" {
  name                = "id-${var.settings.name}"
  resource_group_name = var.settings.resource_group_name
  location            = var.settings.location
}


resource "azurerm_role_assignment" "dns_contributor" {
  scope                = var.settings.private_dns_zone_id
  role_definition_name = "Private DNS Zone Contributor"
  principal_id         = azurerm_user_assigned_identity.aks.principal_id
  depends_on           = [azurerm_user_assigned_identity.aks]
}

resource "azurerm_role_assignment" "network_contributor" {
  scope                = var.settings.vnet_id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_user_assigned_identity.aks.principal_id
  depends_on           = [azurerm_user_assigned_identity.aks]
}

resource "azurerm_kubernetes_cluster" "this" {
  name                          = var.settings.name
  location                      = var.settings.location
  resource_group_name           = var.settings.resource_group_name
  dns_prefix                    = var.settings.name
  kubernetes_version            = var.settings.kubernetes_version
  sku_tier                      = var.settings.sku_tier
  private_cluster_enabled       = var.settings.private_cluster_enabled
  private_dns_zone_id           = var.settings.custom_dns_zone_enabled ? var.settings.private_dns_zone_id : null
  azure_policy_enabled          = var.settings.azure_policy_enabled
  public_network_access_enabled = var.settings.public_network_access_enabled
  local_account_disabled        = true
  node_resource_group           = var.settings.node_resource_group
  oidc_issuer_enabled           = var.settings.oidc_issuer_enabled
  workload_identity_enabled     = var.settings.workload_identity_enabled

  dynamic "key_vault_secrets_provider" {
    for_each = var.settings.key_vault_secrets_provider.secret_rotation_enabled == true ? [1] : []
    content {
      secret_rotation_enabled  = var.settings.key_vault_secrets_provider.secret_rotation_enabled
      secret_rotation_interval = var.settings.key_vault_secrets_provider.secret_rotation_interval
    }
  }
  default_node_pool {
    name                        = var.settings.default_node_pool.name
    node_count                  = var.settings.default_node_pool.node_count
    vm_size                     = var.settings.default_node_pool.vm_size
    enable_auto_scaling         = var.settings.default_node_pool.enable_auto_scaling
    enable_node_public_ip       = var.settings.default_node_pool.enable_node_public_ip
    vnet_subnet_id              = var.settings.default_node_pool.vnet_subnet_id
    max_pods                    = var.settings.default_node_pool.max_pods
    temporary_name_for_rotation = var.settings.default_node_pool.temporary_name_for_rotation
    tags                        = var.settings.tags
    node_labels                 = var.settings.default_node_pool.node_labels
    max_count                   = var.settings.default_node_pool.enable_auto_scaling ? var.settings.default_node_pool.max_count : null
    min_count                   = var.settings.default_node_pool.enable_auto_scaling ? var.settings.default_node_pool.min_count : null
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.aks.id]
  }

  network_profile {
    outbound_type     = var.settings.network_profile.outbound_type
    network_plugin    = "azure"
    network_policy    = "azure"
    load_balancer_sku = var.settings.network_profile.load_balancer_sku
    service_cidr      = var.settings.network_profile.service_cidr
    dns_service_ip    = var.settings.network_profile.dns_service_ip
  }

  #commented for disable container insights
  # oms_agent {
  #   log_analytics_workspace_id = var.settings.oms_agent.log_analytics_workspace_id
  # }

  azure_active_directory_role_based_access_control {
    managed            = var.settings.azure_active_directory_role_based_access_control.managed
    azure_rbac_enabled = var.settings.azure_active_directory_role_based_access_control.azure_rbac_enabled
  }
  tags = var.settings.tags
  # depends_on = [azurerm_role_assignment.dns_contributor, azurerm_role_assignment.network_contributor]
  lifecycle {
    ignore_changes = [
      # workload_identity_enabled, 
      # oidc_issuer_enabled, 
      oidc_issuer_url,
    monitor_metrics, default_node_pool[0].max_pods, default_node_pool[0].node_count]
  }

  depends_on = [azurerm_role_assignment.dns_contributor, azurerm_role_assignment.network_contributor]
}

resource "azurerm_kubernetes_cluster_node_pool" "this" {
  for_each = try({ for np in var.settings.azurerm_kubernetes_cluster_node_pool : np.name => np }, {})

  kubernetes_cluster_id  = azurerm_kubernetes_cluster.this.id
  name                   = each.key
  vm_size                = each.value.vm_size
  os_type                = each.value.os_type
  os_disk_type           = each.value.os_disk_type
  os_disk_size_gb        = each.value.os_disk_size_gb
  priority               = each.value.priority
  vnet_subnet_id         = each.value.vnet_subnet_id
  enable_host_encryption = each.value.enable_host_encryption
  eviction_policy        = each.value.eviction_policy
  enable_auto_scaling    = each.value.enable_auto_scaling
  node_count             = each.value.node_count
  min_count              = each.value.enable_auto_scaling ? each.value.min_count : null
  max_count              = each.value.enable_auto_scaling ? each.value.max_count : null
  max_pods               = each.value.max_pods
  node_labels            = each.value.node_labels
  node_taints            = each.value.node_taints
  enable_node_public_ip  = each.value.enable_node_public_ip
  zones                  = each.value.zones
  tags                   = var.settings.tags

  dynamic "upgrade_settings" {
    for_each = each.value.upgrade_settings != null ? { enabled = true } : {}
    content {
      max_surge = each.value.upgrade_settings.max_surge
    }

  }

  lifecycle {
    ignore_changes = [node_count, min_count, max_count]
  }
}

resource "azurerm_private_endpoint" "this" {
  name                          = var.settings.private_endpoint.endpoint_name
  location                      = var.settings.location
  resource_group_name           = var.settings.resource_group_name
  subnet_id                     = var.settings.private_endpoint.subnet_id
  custom_network_interface_name = replace(var.settings.private_endpoint.endpoint_name, "pep-", "pepnic-")
  private_service_connection {
    name                           = var.settings.private_endpoint.connection_name
    private_connection_resource_id = azurerm_kubernetes_cluster.this.id
    is_manual_connection           = false
    subresource_names              = ["management"]
  }
}
