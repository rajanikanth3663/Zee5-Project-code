resource "azurerm_stream_analytics_cluster" "this" {
  name                = var.settings.name
  location            = var.settings.location
  resource_group_name = var.settings.resource_group_name
  streaming_capacity  = var.settings.streaming_capacity
  tags                = var.settings.tags
  lifecycle {
    ignore_changes = [streaming_capacity]
  }
}


resource "azurerm_stream_analytics_managed_private_endpoint" "this" {
  for_each                      = { for n in var.settings.managed_private_endpoint : n.endpoint_name => n }
  name                          = each.key
  resource_group_name           = var.settings.resource_group_name
  stream_analytics_cluster_name = azurerm_stream_analytics_cluster.this.name
  target_resource_id            = each.value.target_resource_id
  subresource_name              = each.value.subresource_name
}
