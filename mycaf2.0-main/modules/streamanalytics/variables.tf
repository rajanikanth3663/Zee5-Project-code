variable "settings" {
  description = "App Service Plan configuration."
  type = object({
    name                = string
    location            = string
    resource_group_name = string
    streaming_capacity  = string
    tags                = optional(map(string), null)


    managed_private_endpoint = optional(list(object({
      endpoint_name      = string
      target_resource_id = string
      subresource_name   = string
    })))

  })


}
