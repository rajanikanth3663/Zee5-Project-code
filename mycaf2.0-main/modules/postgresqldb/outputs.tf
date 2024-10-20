output "id" {
  value       = azurerm_postgresql_flexible_server_database.this.id
  description = "The ID of this PostgreSQL DB"
}
output "name" {
  value       = azurerm_postgresql_flexible_server_database.this.name
  description = "The name of this PostgreSQL DB"
}
