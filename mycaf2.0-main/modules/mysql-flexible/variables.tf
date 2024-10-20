variable "settings" {
  description = "mysql configurations"
  type = object({
    name                         = string
    location                     = string
    resource_group_name          = string
    version                      = optional(string, "8.0.21")
    delegated_subnet_id          = string
    private_dns_zone_id          = optional(string, null)
    zone                         = optional(string, "2")
    sku_name                     = optional(string, "GP_Standard_D2ds_v4")
    backup_retention_days        = optional(number, 7)
    geo_redundant_backup_enabled = optional(bool, true)

    # administrator_login          = optional(string, "psqladmin")
    # administrator_password       = optional(string, "H@Sh1CoR3!")
    administrator_login    = optional(string)
    administrator_password = optional(string)
    create_mode            = optional(string)
    source_server_id       = optional(string)
    high_availability = optional(object({
      mode                      = string
      standby_availability_zone = number
    }))

    storage = optional(object({
      auto_grow_enabled = bool
      iops              = number
      size_gb           = number
      }), {
      auto_grow_enabled = true
      iops              = 360
      size_gb           = 20
    })

    tenant_id = string
    firewall_rule = optional(list(object({
      name             = string
      start_ip_address = string
      end_ip_address   = string
    })))

    azurerm_mysql_flexible_server_database = list(object({
      name      = string
      collation = optional(string, "utf8mb3_unicode_ci")
      charset   = optional(string, "utf8mb3")
    }))


    tags = optional(map(string))
  })
}
