variable "settings" {
  description = "Storage account configurations"
  type = object({
    name                         = string
    location                     = string
    resource_group_name          = string
    sku                          = optional(string, "Standard")
    soft_delete_enabled          = optional(bool, true)
    storage_mode_type            = optional(string, "GeoRedundant")
    cross_region_restore_enabled = optional(bool, true)

    tags = optional(map(string), {
    })


    private_endpoint = optional(list(object({
      endpoint_name        = string
      subnet_id            = string
      connection_name      = string
      private_dns_zone_ids = optional(list(string))
      subresource_names    = list(string) #AzureSiteRecovery
    })))

    backup_policy_vm = optional(list(object({
      name = string
    })))

    backup_protected_vm = optional(list(object({
      source_vm_id     = string
      backup_policy_id = string
    })))
  })
}
