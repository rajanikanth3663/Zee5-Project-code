output "id" {
  value       = azurerm_mssql_managed_instance.sqlmi.id
  description = "The SQL Managed Instance ID."
}

output "fqdn" {
  value       = azurerm_mssql_managed_instance.sqlmi.fqdn
  description = "The fully qualified domain name of the Azure Managed SQL Instance"
}