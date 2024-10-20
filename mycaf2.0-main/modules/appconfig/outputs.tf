output "id" {
  value       = azurerm_app_configuration.this.id
  description = "The ID of the App configuration"
}

output "appconfig_name" {
  value       = azurerm_app_configuration.this.name
  description = "The name of App configuration."
}
