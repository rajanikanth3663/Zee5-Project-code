variable "settings" {
  description = "servicebus namespace configuration"

  type = object({
    name                          = string
    location                      = string
    resource_group_name           = string
    sku                           = optional(string, "Premium")
    local_auth_enabled            = optional(bool, true)
    minimum_tls_version           = optional(string, "1.2")
    zone_redundant                = optional(bool, true)
    capacity                      = number
    public_network_access_enabled = optional(bool, false)

    network_rule_set = optional(object({
      default_action           = optional(string, "Allow")
      trusted_services_allowed = optional(bool, true)
      ip_rules                 = optional(list(string), [])

      network_rules = optional(object({
        subnet_id                            = string
        ignore_missing_vnet_service_endpoint = optional(bool, true)
      }))
    }))

    servicebus_queue = optional(list(object({
      name             = string
      requires_session = optional(bool, false)
    })))

    private_endpoint = object({
      endpoint_name        = string
      subnet_id            = string
      connection_name      = string
      private_dns_zone_ids = optional(list(string))
    })

    tags = optional(map(string), {
      managedby = "terraform"
    })

  })
}
