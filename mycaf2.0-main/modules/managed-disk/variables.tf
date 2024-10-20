variable "settings" {
  description = "configure_managed_disk_resources"

  type = object({
    azurerm_managed_disk = list(object({
      name                 = string
      location             = string
      resource_group_name  = string
      storage_account_type = string
      create_option        = string
      disk_size_gb         = string
    }))
  })
}

