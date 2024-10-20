variable "settings" {
  description = "Key vault configuration."
  type = object({
    azurerm_key_vault_name      = string
    location                    = string
    resource_group_name         = string
    sku_name                    = optional(string, "standard")
    purge_protection_enabled    = optional(bool, false)
    tags                        = optional(map(string), null)
    enabled_for_disk_encryption = optional(bool, true)
    tenant_id                   = string
    network_rules = optional(object({
      default_action             = string
      ip_rules                   = optional(list(string))
      virtual_network_subnet_ids = optional(list(string))
    }))
    private_endpoint = object({
      endpoint_name        = string
      subnet_id            = string
      connection_name      = string
      private_dns_zone_ids = optional(list(string))
    })
  })
}
