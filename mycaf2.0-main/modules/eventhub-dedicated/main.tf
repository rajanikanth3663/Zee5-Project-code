resource "azurerm_eventhub_cluster" "this" {
  name                = var.settings.name
  resource_group_name = var.settings.resource_group_name
  location            = var.settings.location
  sku_name            = "Dedicated_1"
  tags                = var.settings.tags
}
