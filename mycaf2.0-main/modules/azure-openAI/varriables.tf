variable "settings" {
  type = object({
    name                          = string
    location                      = string
    resource_group_name           = string
    sku                           = optional(string, "S0")
    tags                          = optional(map(string), null)
    dynamic_throttling_enabled    = optional(bool)
    fqdns                         = optional(list(string), null)
    local_auth_enabled            = optional(bool, false)
    public_network_access_enabled = optional(bool, false)
    custom_subdomain_name         = optional(string) # Required if network acl is set

    network_acls = optional(object({
      default_action = string
      ip_rules       = optional(list(string))
      subnet_id      = optional(list(string))
    }), null)

    customer_managed_key = optional(object({
      key_vault_key_id   = optional(string)
      identity_client_id = optional(string)
    }), null)

    identity = optional(object({
      type         = optional(string)
      identity_ids = optional(list(string))
    }), null)

    storage = optional(object({
      storage_account_id = optional(string)
      identity_client_id = optional(string)
    }), null)

    azurerm_cognitive_deployment = map(object({
      rai_policy_name = optional(string)
      #version_upgrade_option = optional(string)
      name = string

      model = object({
        format  = string
        name    = string
        version = string
      })

      scale = object({
        type     = string
        tier     = optional(string)
        size     = optional(string)
        family   = optional(string)
        capacity = optional(string)
      })
    }))

    private_endpoint_enabled = optional(bool, true)

    private_endpoint = optional(object({
      endpoint_name        = optional(string)
      subnet_id            = optional(string)
      location             = string
      connection_name      = optional(string)
      private_dns_zone_ids = optional(list(string))
    }))
  })
}
