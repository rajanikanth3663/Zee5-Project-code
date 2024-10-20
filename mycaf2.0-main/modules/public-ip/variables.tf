variable "settings" {
  description = "Public IP configuration."
  type = object({
    name                    = string
    location                = string
    resource_group_name     = string
    allocation_method       = optional(string, "Static")
    zones                   = optional(list(string), [])
    sku                     = optional(string, "Standard")
    ddos_protection_mode    = optional(string, "VirtualNetworkInherited")
    ddos_protection_plan_id = optional(string, null)
    domain_name_label       = optional(string)
    ip_tags                 = optional(map(string), null)
    tags                    = optional(map(string), null)
  })
}
