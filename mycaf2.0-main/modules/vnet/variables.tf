variable "settings" {
  description = "VNET configuration."
  type = object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    dns_servers         = optional(list(string))

    ddos_protection_plan = optional(object({
      id     = optional(string)
      enable = optional(bool, true)
    }))

    subnets = list(object({
      name              = string
      address_prefixes  = list(string)
      service_endpoints = optional(list(string), null)
      delegation = optional(object({
        name                   = string
        service_delegated_name = string
        actions                = optional(list(string))
      }))
    }))

    tags = map(string)
  })
}
