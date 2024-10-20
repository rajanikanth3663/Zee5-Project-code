resource "azurerm_redis_enterprise_cluster" "this" {
  for_each            = try({ for r in var.settings.azurerm_redis_enterprise_cluster : r.name => r }, {})
  name                = each.key
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  sku_name            = each.value.sku_name
}


resource "azurerm_redis_enterprise_database" "this" {
  name = var.settings.azurerm_redis_enterprise_database.name
  # resource_group_name            = var.settings.azurerm_redis_enterprise_database.resource_group_name
  cluster_id                     = var.settings.azurerm_redis_enterprise_database.cluster_id
  client_protocol                = var.settings.azurerm_redis_enterprise_database.client_protocol
  clustering_policy              = var.settings.azurerm_redis_enterprise_database.clustering_policy
  eviction_policy                = var.settings.azurerm_redis_enterprise_database.eviction_policy
  port                           = var.settings.azurerm_redis_enterprise_database.port
  linked_database_id             = var.settings.azurerm_redis_enterprise_database.linked_database_id
  linked_database_group_nickname = var.settings.azurerm_redis_enterprise_database.linked_database_group_nickname

  depends_on = [azurerm_redis_enterprise_cluster.this]

  dynamic "module" {
    for_each = var.settings.azurerm_redis_enterprise_database.module != null ? var.settings.azurerm_redis_enterprise_database.module : []
    content {
      name = module.value.name
      args = module.value.args
    }
  }

  lifecycle {
    ignore_changes = [cluster_id]
  }

}


resource "azurerm_private_endpoint" "this" {
  for_each            = try({ for r in var.settings.azurerm_redis_enterprise_cluster : r.name => r }, {})
  name                = var.settings.private_endpoint.endpoint_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  subnet_id           = var.settings.private_endpoint.subnet_id

  private_service_connection {

    name                           = var.settings.private_endpoint.connection_name
    private_connection_resource_id = azurerm_redis_enterprise_cluster.this[each.value.name].id
    is_manual_connection           = false
    subresource_names              = ["redisEnterprise"]

  }
}
