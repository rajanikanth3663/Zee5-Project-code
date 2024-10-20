resource "azurerm_cosmosdb_account" "this" {
  name                      = var.settings.name
  location                  = var.settings.location
  resource_group_name       = var.settings.resource_group_name
  offer_type                = var.settings.offer_type
  enable_automatic_failover = true
  kind                      = var.settings.kind

  analytical_storage_enabled = var.settings.analytical_storage_enabled

  dynamic "analytical_storage" {
    for_each = var.settings.analytical_storage_enabled != null ? ["enabled"] : []
    content {
      schema_type = var.settings.analytical_storage.schema_type
    }
  }

  dynamic "capabilities" {
    for_each = var.settings.capabilities != null ? var.settings.capabilities : []
    content {
      name = capabilities.value.name
    }
  }

  dynamic "capacity" {
    for_each = var.settings.capacity != null ? var.settings.capacity : []
    content {
      total_throughput_limit = capacity.value.total_throughput_limit
    }
  }

  dynamic "geo_location" {
    for_each = var.settings.geo_location != null ? var.settings.geo_location : []
    content {
      location          = geo_location.value.location
      failover_priority = geo_location.value.failover_priority
      zone_redundant    = geo_location.value.zone_redundant
    }
  }

  consistency_policy {
    consistency_level       = var.settings.consistency_policy.consistency_level
    max_interval_in_seconds = var.settings.consistency_policy.max_interval_in_seconds
    max_staleness_prefix    = var.settings.consistency_policy.max_staleness_prefix
  }

  ip_range_filter                       = try(join(",", var.settings.ip_range_filter), null)
  public_network_access_enabled         = var.settings.public_network_access_enabled
  is_virtual_network_filter_enabled     = var.settings.is_virtual_network_filter_enabled
  network_acl_bypass_for_azure_services = var.settings.network_acl_bypass_for_azure_services
  network_acl_bypass_ids                = var.settings.network_acl_bypass_ids

  dynamic "virtual_network_rule" {
    for_each = var.settings.virtual_network_rule != null ? toset(var.settings.virtual_network_rule) : []
    content {
      id                                   = virtual_network_rule.value.id
      ignore_missing_vnet_service_endpoint = virtual_network_rule.value.ignore_missing_vnet_service_endpoint
    }
  }

  dynamic "backup" {
    for_each = var.settings.backup != null ? ["enabled"] : []
    content {
      type                = var.settings.backup.type
      interval_in_minutes = var.settings.backup.interval_in_minutes
      retention_in_hours  = var.settings.backup.retention_in_hours
    }
  }

  dynamic "identity" {
    for_each = var.settings.identity != null ? ["enabled"] : []
    content {
      type = var.settings.identity.type
    }
  }

  tags = var.settings.tags
  lifecycle {
    ignore_changes = [capabilities]
  }

}

resource "azurerm_private_endpoint" "this" {
  for_each                      = try({ for n in var.settings.private_endpoint : n.endpoint_name => n }, {})
  name                          = each.key
  location                      = var.settings.location
  resource_group_name           = var.settings.resource_group_name
  subnet_id                     = each.value.subnet_id
  custom_network_interface_name = replace(each.key, "pep-", "pepnic-")
  private_service_connection {
    name                           = each.value.connection_name
    private_connection_resource_id = azurerm_cosmosdb_account.this.id
    is_manual_connection           = false
    subresource_names              = each.value.subresource_names
  }

  private_dns_zone_group {
    name                 = "${each.key}-dns-zone-group"
    private_dns_zone_ids = each.value.private_dns_zone_ids
  }
}
