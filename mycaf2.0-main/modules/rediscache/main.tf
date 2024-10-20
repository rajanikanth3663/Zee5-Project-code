resource "azurerm_redis_cache" "this" {
  name                          = var.settings.name
  location                      = var.settings.location
  resource_group_name           = var.settings.resource_group_name
  capacity                      = var.settings.capacity
  family                        = contains(["Basic", "Standard"], var.settings.sku_name) == true ? "C" : "P"
  sku_name                      = var.settings.sku_name
  enable_non_ssl_port           = var.settings.enable_non_ssl_port
  minimum_tls_version           = var.settings.minimum_tls_version
  public_network_access_enabled = var.settings.public_network_access_enabled
  tags                          = var.settings.tags
  shard_count                   = var.settings.shard_count
  dynamic "redis_configuration" {
    for_each = var.settings.redis_configuration != null ? [1] : []

    content {
      enable_authentication           = var.settings.redis_configuration.enable_authentication
      maxmemory_reserved              = contains(["Premium", "Standard"], var.settings.sku_name) == true ? var.settings.redis_configuration.maxmemory_reserved : null
      maxmemory_delta                 = contains(["Premium", "Standard"], var.settings.sku_name) == true ? var.settings.redis_configuration.maxmemory_delta : null
      maxfragmentationmemory_reserved = contains(["Premium", "Standard"], var.settings.sku_name) == true ? var.settings.redis_configuration.maxfragmentationmemory_reserved : null
      maxmemory_policy                = redis_configuration.value.maxmemory_policy
      rdb_backup_enabled              = var.settings.sku_name == "Premium" ? redis_configuration.value.rdb_backup_enabled : null
      rdb_backup_frequency            = redis_configuration.value.rdb_backup_enabled == true ? redis_configuration.value.rdb_backup_frequency : null
      rdb_backup_max_snapshot_count   = redis_configuration.value.rdb_backup_enabled == true ? redis_configuration.value.rdb_backup_max_snapshot_count : null
    }
  }

  lifecycle {
    
  }
}

resource "azurerm_private_endpoint" "this" {
  name                = var.settings.private_endpoint.endpoint_name
  location            = var.settings.location
  resource_group_name = var.settings.resource_group_name
  subnet_id           = var.settings.private_endpoint.subnet_id

  private_service_connection {
    name                           = var.settings.private_endpoint.connection_name
    private_connection_resource_id = azurerm_redis_cache.this.id
    is_manual_connection           = false
    subresource_names              = ["redisCache"]

  }


  private_dns_zone_group {
    name                 = "${var.settings.private_endpoint.endpoint_name}-dns-zone-group"
    private_dns_zone_ids = var.settings.private_endpoint.private_dns_zone_ids
  }
}
