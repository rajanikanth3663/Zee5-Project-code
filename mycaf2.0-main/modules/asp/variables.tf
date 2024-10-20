variable "settings" {
  description = "App Service Plan configuration."
  type = object({
    name                = string
    location            = string
    resource_group_name = string
    os_type             = string
    sku_name            = string
    tags                = optional(map(string), null)
  })
}
