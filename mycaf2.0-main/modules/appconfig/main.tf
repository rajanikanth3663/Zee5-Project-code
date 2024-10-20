data "azurerm_client_config" "current" {}
resource "azurerm_app_configuration" "this" {
  name                       = var.settings.name
  resource_group_name        = var.settings.resource_group_name
  location                   = var.settings.location
  sku                        = var.settings.sku
  local_auth_enabled         = var.settings.local_auth_enabled
  public_network_access      = var.settings.public_network_access
  purge_protection_enabled   = var.settings.purge_protection_enabled
  soft_delete_retention_days = var.settings.soft_delete_retention_days
  tags                       = var.settings.tags

  # identity {
  #   type         = "UserAssigned"
  #   identity_ids = var.settings.identity.identity_ids
  # }

}



resource "azurerm_role_assignment" "this" {
  for_each             = try({ for n in var.settings.role_assignment : n.name => n }, {})
  scope                = azurerm_app_configuration.this.id
  role_definition_name = each.value.role_definition_name
  principal_id         = each.value.principal_id
}

resource "azurerm_private_endpoint" "this" {
  name                          = var.settings.private_endpoint.endpoint_name
  location                      = var.settings.location
  resource_group_name           = var.settings.resource_group_name
  subnet_id                     = var.settings.private_endpoint.subnet_id
  custom_network_interface_name = replace(var.settings.private_endpoint.endpoint_name, "pep-", "pepnic-")
  private_service_connection {
    name                           = var.settings.private_endpoint.connection_name
    private_connection_resource_id = azurerm_app_configuration.this.id
    is_manual_connection           = false
    subresource_names              = ["configurationStores"]
  }

  private_dns_zone_group {
    name                 = "${var.settings.private_endpoint.endpoint_name}-dns-zone-group"
    private_dns_zone_ids = var.settings.private_endpoint.private_dns_zone_ids
  }
}
