output "name" {
  description = "Created Storage Account name."
  value       = azurerm_storage_account.this.name
}
output "identity" {
  description = "Created Storage Account identity block."
  value       = azurerm_storage_account.this.identity
}
output "id" {
  description = "Created Storage Account ID."
  value       = azurerm_storage_account.this.id
}