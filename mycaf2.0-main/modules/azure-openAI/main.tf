resource "azurerm_cognitive_account" "this" {
  name                          = var.settings.name
  location                      = var.settings.location
  resource_group_name           = var.settings.resource_group_name
  kind                          = "OpenAI"
  sku_name                      = var.settings.sku
  public_network_access_enabled = var.settings.public_network_access_enabled
  dynamic_throttling_enabled    = var.settings.dynamic_throttling_enabled
  fqdns                         = var.settings.fqdns
  local_auth_enabled            = var.settings.local_auth_enabled
  custom_subdomain_name         = var.settings.custom_subdomain_name # Required if network acl is set
  tags                          = var.settings.tags

  dynamic "network_acls" {
    for_each = var.settings.network_acls != null ? ["true"] : []
    content {
      default_action = var.settings.network_acls.default_action
      ip_rules       = var.settings.network_acls.ip_rules


      dynamic "virtual_network_rules" {
        for_each = var.settings.network_acls.subnet_id
        iterator = subnet
        content {
          subnet_id = subnet.value
        }
      }
    }
  }

  dynamic "customer_managed_key" {
    for_each = var.settings.customer_managed_key != null ? [var.settings.customer_managed_key] : []
    content {
      key_vault_key_id   = customer_managed_key.value.key_vault_key_id
      identity_client_id = customer_managed_key.value.identity_client_id
    }
  }

  dynamic "identity" {
    for_each = var.settings.identity != null ? [var.settings.identity] : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "storage" {
    for_each = var.settings.storage != null ? [var.settings.storage] : []
    content {
      storage_account_id = storage.value.storage_account_id
      identity_client_id = storage.value.identity_client_id
    }
  }
}

resource "azurerm_cognitive_deployment" "this" {
  for_each = var.settings.azurerm_cognitive_deployment


  name                 = each.value.name
  cognitive_account_id = azurerm_cognitive_account.this.id

  model {
    format  = each.value.model.format
    name    = each.value.model.name
    version = each.value.model.version
  }

  scale {
    type     = each.value.scale.type
    tier     = each.value.scale.tier
    size     = each.value.scale.size
    family   = each.value.scale.family
    capacity = each.value.scale.capacity
  }

  rai_policy_name = each.value.rai_policy_name
}

resource "azurerm_private_endpoint" "this" {
  count               = var.settings.private_endpoint_enabled == true ? 1 : 0
  name                = var.settings.private_endpoint.endpoint_name
  location            = var.settings.private_endpoint.location
  resource_group_name = var.settings.resource_group_name
  subnet_id           = var.settings.private_endpoint.subnet_id

  private_service_connection {
    name                           = var.settings.private_endpoint.connection_name
    private_connection_resource_id = azurerm_cognitive_account.this.id
    is_manual_connection           = false
    subresource_names              = ["account"]
  }

  private_dns_zone_group {
    name                 = "${var.settings.private_endpoint.endpoint_name}-dns-zone-group"
    private_dns_zone_ids = var.settings.private_endpoint.private_dns_zone_ids
  }
}
