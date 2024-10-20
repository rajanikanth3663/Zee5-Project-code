variable "settings" {
  description = "Fiewall rules configurations"
  type = object({
    name               = string
    firewall_policy_id = string
    priority           = number

    network_rule_collection = optional(object({
      name     = string
      priority = number
      action   = string
      rules = optional(list(object({
        name                  = string
        protocols             = list(string)
        source_addresses      = optional(list(string))
        destination_addresses = optional(list(string))
        destination_ports     = list(string)
        destination_fqdns     = optional(list(string))
      })))
    }))

    application_rule_collection = optional(object({
      name     = string
      priority = string
      action   = string
      rules = optional(list(object({
        name = string
        protocols = list(object({
          type = string
          port = number
        }))
        source_addresses      = list(string)
        destination_fqdns     = optional(list(string))
        destination_fqdn_tags = optional(list(string))
      })))
    }))

    nat_rule_collection = optional(object({
      name     = string
      priority = number
      action   = string
      rules = list(object({
        name                = string
        protocols           = list(string)
        source_addresses    = optional(list(string))
        source_ip_groups    = optional(list(string))
        destination_address = optional(string)
        destination_ports   = optional(list(string))
        translated_address  = optional(string)
        translated_port     = string
        translated_fqdn     = optional(string)
      }))
    }))
  })
}
