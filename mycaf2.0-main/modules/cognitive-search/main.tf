
resource "azurerm_search_service" "this" {
  name                          = var.settings.name
  resource_group_name           = var.settings.resource_group_name
  location                      = var.settings.location
  sku                           = var.settings.sku
  replica_count                 = var.settings.replica_count
  partition_count               = var.settings.partition_count
  public_network_access_enabled = var.settings.public_network_access_enabled
  local_authentication_enabled  = var.settings.local_authentication_enabled
  allowed_ips                   = var.settings.allowed_ips
  #semantic_search_sku           = var.settings.semantic_search_sku # Supported from v3.97.1. But we cannot use this version due to some issue with Storage module

  tags = var.settings.tags

}

resource "azurerm_private_endpoint" "this" {
  name                          = var.settings.private_endpoint.endpoint_name
  location                      = var.settings.location
  resource_group_name           = var.settings.resource_group_name
  subnet_id                     = var.settings.private_endpoint.subnet_id
  custom_network_interface_name = replace(var.settings.private_endpoint.endpoint_name, "pep-", "pepnic-")

  private_service_connection {
    name                           = var.settings.private_endpoint.connection_name
    private_connection_resource_id = azurerm_search_service.this.id
    is_manual_connection           = false
    subresource_names              = ["searchService"]
  }

  private_dns_zone_group {
    name                 = "${var.settings.private_endpoint.endpoint_name}-dns-zone-group"
    private_dns_zone_ids = var.settings.private_endpoint.private_dns_zone_ids
  }
}
