
resource "azurerm_managed_disk" "this" {
  for_each             = try({ for md in var.settings.azurerm_managed_disk : md.name => md }, {})
  name                 = each.key
  location             = each.value.location
  resource_group_name  = each.value.resource_group_name
  storage_account_type = each.value.storage_account_type
  create_option        = each.value.create_option
  disk_size_gb         = each.value.disk_size_gb

  lifecycle {
    ignore_changes = [network_access_policy]
  }
}
