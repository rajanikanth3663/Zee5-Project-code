output "id" {
  value       = azurerm_linux_function_app.this.id
  description = "The azurerm_function_app ID."
}

output "private_ips" {
  value = [for conn in azurerm_private_endpoint.this.private_service_connection : conn.private_ip_address]
}

output "identity_principal_id" {
  value = azurerm_linux_function_app.this.identity[0].principal_id
}
