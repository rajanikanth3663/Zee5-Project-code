variable "settings" {
  description = "App Service Plan configuration."
  type = object({
    name                = string
    data_location       = string
    resource_group_name = string
    tags                = optional(map(string), null)
  })
}
