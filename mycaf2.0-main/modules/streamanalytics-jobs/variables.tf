variable "settings" {
  description = "stream analytics jobs configuration"
  type = object({
    name                                     = string
    location                                 = string
    resource_group_name                      = string
    compatibility_level                      = optional(string, "1.2")
    sku_name                                 = optional(string, "StandardV2")
    data_locale                              = string
    events_late_arrival_max_delay_in_seconds = optional(number, 60)
    events_out_of_order_max_delay_in_seconds = optional(number, 50)
    events_out_of_order_policy               = string
    output_error_policy                      = string
    streaming_units                          = optional(number, 3)
    stream_analytics_cluster_id              = string
    transformation_query                     = string
    tags                                     = optional(map(string), null)
  })
}
