resource "azurerm_virtual_machine_extension" "monitor-windows-agent" {
  name                       = "AzureMonitorWindowsAgent"
  auto_upgrade_minor_version = var.settings.auto_upgrade_minor_version
  automatic_upgrade_enabled  = var.settings.automatic_upgrade_enabled
  publisher                  = "Microsoft.Azure.Monitor"
  type                       = "AzureMonitorWindowsAgent"
  type_handler_version       = "1.14"
  virtual_machine_id         = var.vm_id
}

resource "azurerm_virtual_machine_extension" "dependency-agent" {
  name                       = "DependencyAgentWindows"
  auto_upgrade_minor_version = var.settings.auto_upgrade_minor_version
  automatic_upgrade_enabled  = var.settings.automatic_upgrade_enabled
  publisher                  = "Microsoft.Azure.Monitoring.DependencyAgent"
  type                       = "DependencyAgentWindows"
  type_handler_version       = "9.10"
  virtual_machine_id         = var.vm_id
  settings                   = jsonencode({ "enableAMA" = "true" })
}


resource "azurerm_monitor_data_collection_rule_association" "vminsights" {
  name                    = var.settings.monitor_data_collection_rule_association.name
  data_collection_rule_id = var.settings.data_collection_rule.id
  description             = "Monitor data collection rule"
  target_resource_id      = var.vm_id
  #data_collection_endpoint_id = azurerm_monitor_data_collection_endpoint.dce.id
}

resource "azurerm_monitor_data_collection_rule_association" "dce" {
  target_resource_id          = var.vm_id
  data_collection_endpoint_id = var.settings.data_collection_endpoint.id
  description                 = "Monitor data collection endpoint"
}