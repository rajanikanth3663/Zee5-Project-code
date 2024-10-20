variable "settings" {
  description = "monitor_data_collection_rule"
  type = object({
    name                        = string
    resource_group_name         = string
    location                    = string
    data_collection_endpoint_id = string
    tags                        = optional(map(string), null)

    data_flow = optional(list(object({

      destinations = list(string)
      streams      = list(string)

    })))

    data_sources = optional(list(object({

      extension = optional(list(object({
        extension_name = string
        name           = string
        streams        = list(string)
      })))

      performance_counter = optional(list(object({
        counter_specifiers            = list(string)
        name                          = string
        sampling_frequency_in_seconds = number
        streams                       = list(string)
      })))

      windows_event_log = optional(list(object({
        name           = string
        x_path_queries = list(string)
        streams        = list(string)
      })))

    })))


    destinations = optional(list(object({

      azure_monitor_metrics = optional(list(object({
        name = string
      })))

      log_analytics = optional(list(object({
        name                  = string
        workspace_resource_id = string
      })))

    })))


  })
}
