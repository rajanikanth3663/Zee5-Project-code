variable "settings" {
  description = "Postgres configurations"
  type = object({
    name                         = string
    location                     = string
    resource_group_name          = string
    version                      = optional(string, "12")
    delegated_subnet_id          = optional(string)
    private_dns_zone_id          = optional(string, null)
    zone                         = optional(string, "2")
    storage_mb                   = optional(number, 32768)
    sku_name                     = optional(string, "GP_Standard_D4s_v3")
    backup_retention_days        = optional(number, 7)
    geo_redundant_backup_enabled = optional(bool, true)
    administrator_password       = optional(string)
    administrator_login          = optional(string)
    authentication = object({
      active_directory_auth_enabled = optional(bool, true)
      password_auth_enabled         = optional(bool, false)
      tenant_id                     = optional(string)
    })

    create_mode      = optional(string)
    source_server_id = optional(string)

    firewall_rule = optional(list(object({
      name             = string
      start_ip_address = string
      end_ip_address   = string
    })))

    azurerm_postgresql_flexible_server_database = list(object({
      name      = string
      collation = optional(string, "en_US.utf8")
      charset   = optional(string, "utf8")
    }))


    tags = optional(map(string))
  })
}
