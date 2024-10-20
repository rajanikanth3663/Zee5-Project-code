output "id" {
  description = "The ID of the VNET's."
  value       = azurerm_virtual_network.this.id
}

output "subnet_ids" {
  value = {
    for subnet_name, subnet in azurerm_subnet.this :
    subnet_name => subnet.id
  }
  description = "Map of subnet_name to their IDs."
}