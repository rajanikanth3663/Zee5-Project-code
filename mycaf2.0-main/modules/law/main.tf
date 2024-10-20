resource "azurerm_log_analytics_workspace" "this" {
  name                       = var.settings.name
  location                   = var.settings.location
  resource_group_name        = var.settings.resource_group_name
  sku                        = var.settings.sku
  retention_in_days          = var.settings.retention_in_days
  tags                       = var.settings.tags
  internet_ingestion_enabled = false
  internet_query_enabled     = true

}
