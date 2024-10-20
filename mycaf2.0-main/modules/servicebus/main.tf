resource "azurerm_servicebus_namespace" "this" {
  name                          = var.settings.name
  location                      = var.settings.location
  resource_group_name           = var.settings.resource_group_name
  sku                           = var.settings.sku
  local_auth_enabled            = var.settings.local_auth_enabled
  minimum_tls_version           = var.settings.minimum_tls_version
  zone_redundant                = var.settings.zone_redundant
  capacity                      = var.settings.capacity
  public_network_access_enabled = var.settings.public_network_access_enabled

  identity {
    type = "SystemAssigned"
  }

  # dynamic "network_rule_set" {
  #   for_each = var.settings.network_rule_set != null ? ["enabled"] : []
  #   content {
  #     default_action                = var.settings.network_rule_set.default_action
  #     public_network_access_enabled = var.settings.public_network_access_enabled
  #     trusted_services_allowed      = var.settings.network_rule_set.trusted_services_allowed
  #     ip_rules                      = var.settings.network_rule_set.ip_rules

  #     network_rules {
  #       subnet_id                            = var.settings.network_rule_set.network_rules.subnet_id
  #       ignore_missing_vnet_service_endpoint = var.settings.network_rule_set.network_rules.ignore_missing_vnet_service_endpoint
  #     }
  #   }

  # }

  tags = var.settings.tags
}



resource "azurerm_servicebus_queue" "this" {
  for_each         = try({ for q in var.settings.servicebus_queue : q.name => q }, {})
  name             = each.key
  namespace_id     = azurerm_servicebus_namespace.this.id
  requires_session = each.value.requires_session
}


resource "azurerm_private_endpoint" "this" {
  name                          = var.settings.private_endpoint.endpoint_name
  location                      = var.settings.location
  resource_group_name           = var.settings.resource_group_name
  subnet_id                     = var.settings.private_endpoint.subnet_id
  custom_network_interface_name = replace(var.settings.private_endpoint.endpoint_name, "pep-", "pepnic-")
  private_service_connection {
    name                           = var.settings.private_endpoint.connection_name
    private_connection_resource_id = azurerm_servicebus_namespace.this.id
    is_manual_connection           = false
    subresource_names              = ["namespace"]
  }

  private_dns_zone_group {
    name                 = "${var.settings.private_endpoint.endpoint_name}-dns-zone-group"
    private_dns_zone_ids = var.settings.private_endpoint.private_dns_zone_ids
  }
}