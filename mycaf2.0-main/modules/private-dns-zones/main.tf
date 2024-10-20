resource "azurerm_private_dns_zone" "this" {
  name                = var.settings.name
  resource_group_name = var.settings.resource_group_name
  tags                = var.settings.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "this" {
  for_each              = try({ for n in var.settings.virtual_network_link : n.name => n }, {})
  name                  = each.key
  resource_group_name   = var.settings.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.this.name
  virtual_network_id    = each.value.virtual_network_id
}
