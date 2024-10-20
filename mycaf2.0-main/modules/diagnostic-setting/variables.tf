variable "settings" {
  description = "azurerm_monitor_diagnostic_setting configuration."
  type = object({
    name                       = string
    target_resource_id         = string
    log_analytics_workspace_id = string

    metric = optional(list(object({
      category = string
      enabled  = bool
    })))

    enabled_log = optional(list(object({
      category = string
      enabled  = bool
    })))

  })
}
