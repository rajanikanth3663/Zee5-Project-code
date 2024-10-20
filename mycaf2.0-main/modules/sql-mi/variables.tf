variable "settings" {
  description = "mssql configuration"

  type = object({
    name                         = string
    location                     = string
    resource_group_name          = string
    administrator_login          = string
    administrator_login_password = string
    license_type                 = optional(string, "BasePrice")
    subnet_id                    = string
    subnet_CIDR                  = string
    sku_name                     = optional(string, "GP_Gen5")
    vcores                       = optional(number, 4)
    storage_size_in_gb           = optional(number, 32)
    public_data_endpoint_enabled = optional(bool, false)
    minimum_tls_version          = optional(number, 1.2)
    proxy_override               = optional(string, "Default")
    timezone_id                  = optional(string, "UTC")

    network_security_group_name = string

    azurerm_sql_managed_database = list(object({
      name = string
    }))
    route_table_name = string
    security_rule = optional(map(object({
      #name                                       = string
      description                                = optional(string)
      protocol                                   = string
      source_port_range                          = optional(string)
      source_port_ranges                         = optional(list(number))
      destination_port_range                     = optional(string)
      destination_port_ranges                    = optional(list(number))
      priority                                   = number
      direction                                  = string
      access                                     = string
      source_address_prefix                      = optional(string)
      source_address_prefixes                    = optional(list(string))
      source_application_security_group_ids      = optional(list(string), [])
      destination_address_prefix                 = optional(string)
      destination_address_prefixes               = optional(list(string))
      destination_application_security_group_ids = optional(list(string), [])
    })))
  })
}
