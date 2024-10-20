variable "settings" {
  description = "mssql configuration"

  type = object({
    name                   = string
    location               = string
    resource_group_name    = string
    version                = optional(string, "12.0")
    connection_policy      = optional(string, "Default")
    minimum_tls_version    = optional(string, "1.2")
    elastic_pool_enabled   = optional(bool, true)
    azuread_administrator  = optional(bool, true)
    managed_identity       = string
    administrator_login    = optional(string, "psqladmin")
    administrator_password = optional(string, "H@Sh1CoR3!")

    elasticpool = object({
      name           = optional(string, "")
      license_type   = optional(string, "LicenseIncluded")
      max_size_gb    = optional(string, 32)
      max_size_bytes = optional(string, null)
      per_database_settings = optional(object({
        max_capacity = optional(number, 4)
        min_capacity = optional(number, 1)
      }))

      sku = optional(object({
        capacity = optional(number, 4)
        name     = optional(string, "BC_Gen5")
        tier     = optional(string, "BusinessCritical")
        family   = optional(string, "Gen5")
      }))

    })

    virtual_network_rule = optional(list(object({
      name      = string
      subnet_id = string
    })), [])

    mssql_database = list(object({
      name         = string
      collation    = optional(string, "SQL_Latin1_General_CP1_CI_AS")
      license_type = optional(string, "LicenseIncluded")
      max_size_gb  = number
      read_scale   = optional(bool, true)
      sku_name     = optional(string, "P2")
    }))


    tags = optional(map(string), null)

    private_endpoint_enabled = optional(bool, false)
    private_endpoint = optional(object({
      endpoint_name        = optional(string)
      subnet_id            = optional(string)
      connection_name      = optional(string)
      private_dns_zone_ids = optional(list(string))
    }))
  })
}