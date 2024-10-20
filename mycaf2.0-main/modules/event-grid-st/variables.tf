variable "settings" {
  description = "Event Grid configuration."
  type = object({
    name                   = string
    location               = string
    resource_group_name    = string
    tags                   = optional(map(string), null)
    source_arm_resource_id = string
    topic_type             = optional(string, "Microsoft.Storage.StorageAccounts")

    public_network_access_enabled = optional(bool, true)

    identity = optional(object({
      type         = optional(string, "SystemAssigned")
      identity_ids = optional(list(string))
      }), {

    })

    azurerm_role_assignment = optional(list(object({
      name                 = string
      scope                = string
      role_definition_name = string
    })))

    system_topic_event_subscription = optional(list(object({
      name                          = string
      service_bus_queue_endpoint_id = optional(string)
      eventhub_endpoint_id          = optional(string)
      included_event_types          = optional(list(string), ["Microsoft.Storage.BlobCreated"])

      advanced_filter = optional(list(object({
        string_begins_with = optional(list(object({
          key    = string
          values = list(string)
        })))

        string_ends_with = optional(list(object({
          key    = string
          values = list(string)
        })))
      })))
    })))

    private_endpoint = object({
      endpoint_name        = string
      subnet_id            = string
      connection_name      = string
      private_dns_zone_ids = list(string)
    })

  })
}
