variable "settings" {
  type = object({

    azurerm_redis_enterprise_cluster = optional(list(object({
      name                = string
      resource_group_name = string
      location            = string
      sku_name            = string
    })))

    azurerm_redis_enterprise_database = object({
      cluster_id                     = string
      name                           = string
      resource_group_name            = string
      client_protocol                = string
      clustering_policy              = string
      eviction_policy                = string
      port                           = number
      linked_database_id             = optional(list(string))
      linked_database_group_nickname = optional(string)

      module = optional(list(object({
        name = string
        args = optional(string)
      })))

    })

    private_endpoint = object({
      endpoint_name   = string
      subnet_id       = string
      connection_name = string
    })

  })
}
