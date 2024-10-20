variable "settings" {
  description = "App Service Plan configuration."
  type = object({
    name                       = string
    location                   = string
    resource_group_name        = string
    service_plan_id            = string
    storage_account_name       = string
    storage_account_access_key = string
    virtual_network_subnet_id  = string

    application_stack = object({
      python_version          = optional(string)
      node_version            = optional(string)
      powershell_core_version = optional(string)
    })

    app_settings = optional(map(string))

    identity = optional(object({
      type         = optional(string, "SystemAssigned")
      identity_ids = optional(list(string))
      }), {

    })

    private_endpoint = object({
      endpoint_name        = string
      subnet_id            = string
      connection_name      = string
      private_dns_zone_ids = list(string)
    })

    tags = optional(map(string), null)
  })
}
