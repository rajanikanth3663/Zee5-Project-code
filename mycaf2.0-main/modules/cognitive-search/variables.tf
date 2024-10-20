variable "settings" {
  description = "cognitive search configuration."
  type = object({
    name                          = string
    location                      = string
    resource_group_name           = string
    sku                           = string
    replica_count                 = number
    partition_count               = number
    public_network_access_enabled = optional(bool, false)
    local_authentication_enabled  = optional(bool)
    allowed_ips                   = optional(list(string))
    #semantic_search_sku           = optional(string) # Supported from v3.97.1. But we cannot use this version due to some issue with Storage module



    private_endpoint = object({
      endpoint_name        = string
      subnet_id            = string
      connection_name      = string
      private_dns_zone_ids = list(string)
    })

    tags = optional(map(string), null)
  })
}
