variable "settings" {
  description = "Storage account configurations"
  type = object({
    name                     = string
    location                 = string
    resource_group_name      = string
    account_kind             = optional(string, "StorageV2")
    account_tier             = optional(string, "Standard")
    account_replication_type = optional(string, "GRS")
    tags                     = optional(map(string), null)
    public_network_enabled   = optional(bool, false)
    #soft_delete_retention_days = optional(number, 7)
    #path                       = string

    rules = object({
      default_action             = string
      bypass                     = list(string)
      virtual_network_subnet_ids = list(string)
    })

    containers = list(object({
      name                  = string
      container_access_type = optional(string, "private")
    }))

    file_shares = list(object({
      name             = string
      quota_in_gb      = optional(number, 50)
      enabled_protocol = optional(string)
      metadata         = optional(map(string))
      acl = optional(list(object({
        id          = string
        permissions = string
        start       = optional(string)
        expiry      = optional(string)
      })))
    }))

    queues = list(object({
      name = string
    }))

    tables = list(object({
      name = string
    }))

    filesystem = list(object({
      name = string
    }))

    ace_blocks = optional(list(object({
      scope       = string
      type        = string
      permissions = string
    })))

    paths = list(object({
      name             = string
      file_system_name = string
      path             = string
      resource         = string
    }))

    private_endpoint_enabled = optional(bool, false)
    private_endpoint = optional(list(object({
      endpoint_name        = optional(string)
      subnet_id            = optional(string)
      connection_name      = optional(string)
      subresource_name     = optional(list(string))
      private_dns_zone_ids = optional(list(string))
    })))

  })
}
