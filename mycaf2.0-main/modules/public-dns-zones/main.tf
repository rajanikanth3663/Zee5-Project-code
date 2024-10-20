resource "azurerm_dns_zone" "this" {
  name                = var.settings.name
  resource_group_name = var.settings.resource_group_name
  tags                = var.settings.tags
}
