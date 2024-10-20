resource "azurerm_service_plan" "this" {
  name                = var.settings.name
  resource_group_name = var.settings.resource_group_name
  location            = var.settings.location
  os_type             = var.settings.os_type
  sku_name            = var.settings.sku_name
  tags                = var.settings.tags
}