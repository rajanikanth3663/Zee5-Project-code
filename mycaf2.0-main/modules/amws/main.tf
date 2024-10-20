resource "azurerm_monitor_workspace" "this" {
  name                = "mws-${var.settings.name}"
  resource_group_name = var.settings.resource_group_name
  location            = var.settings.location
}

# resource "azurerm_private_endpoint" "this" {
#   name                          = var.settings.private_endpoint.endpoint_name
#   location                      = var.settings.location
#   resource_group_name           = var.settings.resource_group_name
#   subnet_id                     = var.settings.private_endpoint.subnet_id
#   custom_network_interface_name = replace(var.settings.private_endpoint.endpoint_name, "pep-", "pepnic-")
#   private_service_connection {
#     name                           = var.settings.private_endpoint.connection_name
#     private_connection_resource_id = azurerm_linux_function_app.this.id
#     is_manual_connection           = false
#     subresource_names              = ["sites"]
#   }
#   private_dns_zone_group {
#     name                 = "${var.settings.private_endpoint.endpoint_name}-dns-zone-group"
#     private_dns_zone_ids = var.settings.private_endpoint.private_dns_zone_ids
#   }
# }