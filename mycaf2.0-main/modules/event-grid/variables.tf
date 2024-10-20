variable "settings" {
  description = "Event Grid configuration."
  type = object({
    name                          = string
    location                      = string
    resource_group_name           = string
    tags                          = optional(map(string), null)
    public_network_access_enabled = optional(bool, true)

    private_endpoint = object({
      endpoint_name        = string
      subnet_id            = string
      connection_name      = string
      private_dns_zone_ids = list(string)
    })

  })
}
