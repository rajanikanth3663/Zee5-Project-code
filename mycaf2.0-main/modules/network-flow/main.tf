resource "azurerm_network_watcher_flow_log" "this" {
  network_watcher_name      = var.settings.network_watcher_name
  resource_group_name       = var.settings.resource_group_name
  name                      = var.settings.name
  network_security_group_id = var.settings.network_security_group_id
  storage_account_id        = var.settings.storage_account_id
  enabled                   = var.settings.enabled
  version                   = 2
  tags                      = var.settings.tags

  retention_policy {
    enabled = var.settings.retention_policy.enabled
    days    = var.settings.retention_policy.days
  }

  traffic_analytics {
    enabled               = var.settings.traffic_analytics.enabled
    workspace_id          = var.settings.traffic_analytics.workspace_id
    workspace_region      = var.settings.traffic_analytics.workspace_region
    workspace_resource_id = var.settings.traffic_analytics.workspace_resource_id
    interval_in_minutes   = var.settings.traffic_analytics.interval_in_minutes
  }
}