variable "settings" {
  type = object({
    name                = string
    location            = string
    resource_group_name = string
    resource_group_id   = string
    sku                 = optional(string, "S1")
    tags                = optional(map(string), null)
  })
}
