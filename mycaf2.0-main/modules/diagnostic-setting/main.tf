resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = var.settings.name
  target_resource_id         = var.settings.target_resource_id
  log_analytics_workspace_id = var.settings.log_analytics_workspace_id

  dynamic "metric" {
    for_each = var.settings.metric != null ? var.settings.metric : []
    content {
      category = metric.value.category
      enabled  = metric.value.enabled
    }
  }

  dynamic "enabled_log" {
    for_each = var.settings.enabled_log != null ? var.settings.enabled_log : []
    content {
      category = enabled_log.value.category
    }
  }

  lifecycle {
    ignore_changes = [metric, enabled_log]
  }
}
