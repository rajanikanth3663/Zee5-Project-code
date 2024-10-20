variable "settings" {
  description = "App Service Plan configuration."
  type = object({
    name                = string
    location            = string
    resource_group_name = string
    sku                 = optional(string, "Standard")
    tags                = optional(map(string), null)

    frontend_ip_configuration = object({
      name               = string
      subnet_id          = string
      private_ip_address = optional(string)
    })

    backend_address_pool = object({
      name = string
    })

    lb_probe = object({
      name     = string
      port     = number
      protocol = string
    })

    lb_rule = object({
      name                           = string
      protocol                       = string
      frontend_port                  = number
      backend_port                   = number
      frontend_ip_configuration_name = optional(string, "default")
    })

  })
}
