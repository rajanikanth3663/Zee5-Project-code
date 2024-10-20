resource "azurerm_monitor_data_collection_rule_association" "this" {
  target_resource_id          = var.settings.target_resource_id
  data_collection_endpoint_id = var.settings.data_collection_endpoint_id
  description                 = "monitor_data_collection_endpoint"
}