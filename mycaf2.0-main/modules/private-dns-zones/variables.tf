variable "settings" {
  type = object({
    name                = string
    resource_group_name = string
    tags                = optional(map(string), null)

    virtual_network_link = optional(list(object({
      name               = string
      virtual_network_id = string
    })))
  })
}
