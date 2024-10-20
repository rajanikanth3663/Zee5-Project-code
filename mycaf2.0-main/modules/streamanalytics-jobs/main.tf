resource "azurerm_stream_analytics_job" "this" {
  name                                     = var.settings.name
  location                                 = var.settings.location
  sku_name                                 = var.settings.sku_name
  resource_group_name                      = var.settings.resource_group_name
  compatibility_level                      = var.settings.compatibility_level
  data_locale                              = var.settings.data_locale
  events_late_arrival_max_delay_in_seconds = var.settings.events_late_arrival_max_delay_in_seconds
  events_out_of_order_max_delay_in_seconds = var.settings.events_out_of_order_max_delay_in_seconds
  events_out_of_order_policy               = var.settings.events_out_of_order_policy
  output_error_policy                      = var.settings.output_error_policy
  streaming_units                          = var.settings.streaming_units
  stream_analytics_cluster_id              = var.settings.stream_analytics_cluster_id
  transformation_query                     = var.settings.transformation_query
  tags                                     = var.settings.tags
  lifecycle {
    ignore_changes = [transformation_query,
      job_storage_account,
      streaming_units,
      events_late_arrival_max_delay_in_seconds,
      events_out_of_order_max_delay_in_seconds,
      output_error_policy,
      data_locale,
      tags
    ]
  }
}
