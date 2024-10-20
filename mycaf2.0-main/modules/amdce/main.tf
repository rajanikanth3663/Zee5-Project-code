resource "azurerm_monitor_data_collection_endpoint" "this" {
  name                          = var.settings.name
  resource_group_name           = var.settings.resource_group_name
  location                      = var.settings.location
  kind                          = var.settings.kind
  public_network_access_enabled = var.settings.public_network_access_enabled
  description                   = "monitor_data_collection_endpoint"
  tags                          = var.settings.tags
}