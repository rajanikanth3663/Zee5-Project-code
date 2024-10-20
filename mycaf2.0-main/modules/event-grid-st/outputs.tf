output "id" {
  value       = azurerm_eventgrid_system_topic.this.id
  description = "The event Grid ID."
}

output "identity_principal_id" {
  value = azurerm_eventgrid_system_topic.this.identity[0].principal_id
}
