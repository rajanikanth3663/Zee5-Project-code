variable "settings" {
  type = object({
    name                = string
    resource_group_name = string
    tags                = optional(map(string), null)
  })
}
