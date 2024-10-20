resource "azurerm_monitor_data_collection_rule" "this" {
  name                        = var.settings.name
  resource_group_name         = var.settings.resource_group_name
  location                    = var.settings.location
  data_collection_endpoint_id = var.settings.data_collection_endpoint_id
  tags                        = var.settings.tags

  dynamic "data_flow" {
    for_each = var.settings.data_flow != null ? var.settings.data_flow : []

    content {
      destinations = data_flow.value.destinations
      streams      = data_flow.value.streams
    }
  }

  dynamic "data_sources" {
    for_each = var.settings.data_sources != null ? var.settings.data_sources : []

    content {

      dynamic "extension" {
        for_each = data_sources.value.extension != null ? data_sources.value.extension : []

        content {
          extension_name = extension.value.extension_name
          name           = extension.value.name
          streams        = extension.value.streams
        }
      }

      dynamic "performance_counter" {
        for_each = data_sources.value.performance_counter != null ? data_sources.value.performance_counter : []

        content {
          counter_specifiers            = performance_counter.value.counter_specifiers
          name                          = performance_counter.value.name
          sampling_frequency_in_seconds = performance_counter.value.sampling_frequency_in_seconds
          streams                       = performance_counter.value.streams
        }
      }

      dynamic "windows_event_log" {
        for_each = data_sources.value.windows_event_log != null ? data_sources.value.windows_event_log : []

        content {

          name           = windows_event_log.value.name
          x_path_queries = windows_event_log.value.x_path_queries
          streams        = windows_event_log.value.streams
        }
      }

    }
  }

  dynamic "destinations" {
    for_each = var.settings.destinations

    content {

      dynamic "azure_monitor_metrics" {
        for_each = destinations.value.azure_monitor_metrics != null ? destinations.value.azure_monitor_metrics : []
        content {
          name = azure_monitor_metrics.value.name
        }
      }


      dynamic "log_analytics" {
        for_each = destinations.value.log_analytics != null ? destinations.value.log_analytics : []
        content {
          name                  = log_analytics.value.name
          workspace_resource_id = log_analytics.value.workspace_resource_id
        }
      }
    }
  }
}
