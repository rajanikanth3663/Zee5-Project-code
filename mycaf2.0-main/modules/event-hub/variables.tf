variable "settings" {
  description = "Event-hub variables"
  type = object({

    resource_group_name           = string
    location                      = string
    tags                          = optional(map(string), null)
    eventhub_namespace_name       = string
    eventhub_namespace_sku        = string
    eventhub_namespace_capacity   = number
    public_network_access_enabled = optional(bool, true)
    minimum_tls_version           = optional(string, "1.2")
    auto_inflate_enabled          = optional(bool)
    dedicated_cluster_id          = optional(string)
    maximum_throughput_units      = optional(number)
    zone_redundant                = optional(bool)
    identity = optional(object({
      type         = optional(string, "SystemAssigned")
      identity_ids = optional(list(string))

    }))

    network_rulesets = optional(object({
      default_action                 = string
      trusted_service_access_enabled = optional(bool, true)
      ip_rules                       = optional(list(string))
      subnet_ids                     = optional(list(string))

    }))


    eventhub = optional(list(object({
      name              = string
      partition_count   = optional(number, 2)
      message_retention = optional(number, 1)
      status            = optional(string)
      capture_description = optional(object({
        enabled             = optional(bool)
        encoding            = optional(string)
        interval_in_seconds = optional(number)
        size_limit_in_bytes = optional(number)
        skip_empty_archives = optional(bool)
        destination = optional(object({
          archive_name_format = optional(string)
          blob_container_name = optional(string)
          name                = optional(string)
          storage_account_id  = optional(string)
        }))
      }))
    })))

    azurerm_eventhub_consumer_group = optional(list(object({
      name          = string
      eventhub_name = string
      user_metadata = optional(string)
    })))

    azurerm_eventhub_namespace_authorization_rule = optional(list(object({
      name   = string
      listen = optional(bool, false)
      send   = optional(bool, false)
      manage = optional(bool, false)
    })))

    azurerm_eventhub_authorization_rule = optional(list(object({
      name          = string
      eventhub_name = string
      listen        = optional(bool, false)
      send          = optional(bool, false)
      manage        = optional(bool, false)
    })))

    azurerm_eventhub_namespace_schema_group = optional(object({
      name                 = string
      schema_compatibility = string
      schema_type          = string

    }))

    private_endpoint = optional(object({
      endpoint_name        = optional(string)
      subnet_id            = optional(string)
      connection_name      = optional(string)
      private_dns_zone_ids = optional(list(string))
    }))
  })


}
