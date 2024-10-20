resource "azurerm_recovery_services_vault" "this" {
  name                          = var.settings.name
  location                      = var.settings.location
  resource_group_name           = var.settings.resource_group_name
  sku                           = var.settings.sku
  soft_delete_enabled           = var.settings.soft_delete_enabled
  public_network_access_enabled = false
  storage_mode_type             = var.settings.storage_mode_type
  cross_region_restore_enabled  = var.settings.cross_region_restore_enabled

  identity {
    type = "SystemAssigned"
  }
  tags = var.settings.tags
}
resource "azurerm_private_endpoint" "this" {
  for_each                      = try({ for n in var.settings.private_endpoint : n.endpoint_name => n }, {})
  name                          = each.key
  location                      = var.settings.location
  resource_group_name           = var.settings.resource_group_name
  subnet_id                     = each.value.subnet_id
  custom_network_interface_name = replace(each.key, "pep-", "pepnic-")
  private_service_connection {
    name                           = each.value.connection_name
    private_connection_resource_id = azurerm_recovery_services_vault.this.id
    is_manual_connection           = false
    subresource_names              = each.value.subresource_names
  }

  private_dns_zone_group {
    name                 = "${each.key}-dns-zone-group"
    private_dns_zone_ids = each.value.private_dns_zone_ids
  }
}


resource "azurerm_backup_policy_vm" "this" {
  for_each            = try({ for n in var.settings.backup_policy_vm : n.name => n }, {})
  name                = each.key
  resource_group_name = var.settings.resource_group_name
  recovery_vault_name = azurerm_recovery_services_vault.this.name

  timezone = "India Standard Time"

  backup {
    frequency = "Daily"
    time      = "22:00"
  }

  retention_daily {
    count = 7
  }
}


resource "azurerm_backup_protected_vm" "this" {
  for_each            = try({ for n in var.settings.backup_protected_vm : n.source_vm_id => n }, {})
  resource_group_name = var.settings.resource_group_name
  recovery_vault_name = azurerm_recovery_services_vault.this.name
  source_vm_id        = each.key
  backup_policy_id    = each.value.backup_policy_id
}