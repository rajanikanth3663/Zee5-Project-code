variable "settings" {
  description = "App Service Plan configuration."
  type = object({
    name                          = string
    location                      = string
    resource_group_name           = string
    kind                          = optional(string)
    public_network_access_enabled = optional(bool)
    tags                          = optional(map(string), null)
  })
}
