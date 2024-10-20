resource "azurerm_communication_service" "this" {
  name                = var.settings.name
  resource_group_name = var.settings.resource_group_name
  data_location       = var.settings.data_location
  tags                = var.settings.tags
}