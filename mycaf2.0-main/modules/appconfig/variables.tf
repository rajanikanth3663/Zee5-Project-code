variable "settings" {
  type = object({
    name                       = string
    location                   = string
    resource_group_name        = string
    sku                        = optional(string, "standard")
    local_auth_enabled         = optional(bool, true)
    purge_protection_enabled   = optional(bool, "false")
    public_network_access      = optional(string, "Disabled")
    soft_delete_retention_days = optional(number, 1)
    shareable_link_enabled     = optional(bool, false)
    tunneling_enabled          = optional(bool, false)

    # identity = optional(list(object({
    #   identity_ids = list(string)
    # })))

    role_assignment = optional(list(object({
      name                 = string
      role_definition_name = string
      principal_id         = string
    })))

    tags = optional(map(string), null)

    private_endpoint = object({
      endpoint_name        = string
      subnet_id            = string
      connection_name      = string
      private_dns_zone_ids = optional(list(string))
    })

  })
}
