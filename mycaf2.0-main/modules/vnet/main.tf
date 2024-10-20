resource "azurerm_virtual_network" "this" {
  name                = var.settings.name
  resource_group_name = var.settings.resource_group_name
  location            = var.settings.location
  address_space       = var.settings.address_space
  dns_servers         = var.settings.dns_servers
  tags                = var.settings.tags

  dynamic "ddos_protection_plan" {
    for_each = var.settings.ddos_protection_plan != null ? ["enabled"] : []
    content {
      id     = var.settings.ddos_protection_plan.id
      enable = var.settings.ddos_protection_plan.enable
    }
  }
}

resource "azurerm_subnet" "this" {
  for_each             = { for s in var.settings.subnets : s.name => s }
  name                 = each.value.name
  resource_group_name  = var.settings.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = each.value.address_prefixes
  service_endpoints    = each.value.service_endpoints
  dynamic "delegation" {
    for_each = each.value.delegation != null ? [each.value.delegation] : []
    content {
      name = delegation.value.name
      service_delegation {
        name    = delegation.value.service_delegated_name
        actions = delegation.value.actions
      }
    }
  }
}
