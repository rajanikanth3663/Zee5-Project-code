
# Create the Event-hub namespace
resource "azurerm_eventhub_namespace" "this" {
  name                     = var.settings.eventhub_namespace_name
  location                 = var.settings.location
  resource_group_name      = var.settings.resource_group_name
  sku                      = var.settings.eventhub_namespace_sku
  capacity                 = var.settings.eventhub_namespace_capacity
  minimum_tls_version      = var.settings.minimum_tls_version
  auto_inflate_enabled     = var.settings.auto_inflate_enabled
  dedicated_cluster_id     = var.settings.dedicated_cluster_id
  maximum_throughput_units = var.settings.maximum_throughput_units
  zone_redundant           = var.settings.zone_redundant



  identity {
    type         = var.settings.identity.type
    identity_ids = var.settings.identity.identity_ids
  }

  dynamic "network_rulesets" {
    for_each = var.settings.network_rulesets != null ? ["true"] : []
    content {
      default_action                 = var.settings.network_rulesets.default_action
      trusted_service_access_enabled = var.settings.network_rulesets.trusted_service_access_enabled
      public_network_access_enabled  = var.settings.public_network_access_enabled

      dynamic "ip_rule" {
        for_each = var.settings.network_rulesets.ip_rules
        iterator = iprule
        content {
          ip_mask = iprule.value

        }
      }

      dynamic "virtual_network_rule" {
        for_each = var.settings.network_rulesets.subnet_ids
        iterator = subnet
        content {
          subnet_id = subnet.value
        }
      }
    }
  }


  public_network_access_enabled = var.settings.public_network_access_enabled


  tags = var.settings.tags

}

resource "azurerm_eventhub" "this" {
  for_each = try({ for np in var.settings.eventhub : np.name => np }, {})

  name                = each.key
  namespace_name      = azurerm_eventhub_namespace.this.name
  resource_group_name = var.settings.resource_group_name
  partition_count     = each.value.partition_count
  message_retention   = each.value.message_retention
  status              = each.value.status

  dynamic "capture_description" {
    for_each = each.value.capture_description == null ? [] : ["enabled"]
    content {
      enabled             = each.value.capture_description.enabled
      encoding            = each.value.capture_description.encoding
      interval_in_seconds = each.value.capture_description.interval_in_seconds
      size_limit_in_bytes = each.value.capture_description.size_limit_in_bytes
      skip_empty_archives = each.value.capture_description.skip_empty_archives

      destination {
        archive_name_format = each.value.capture_description.destination.archive_name_format
        blob_container_name = each.value.capture_description.destination.blob_container_name
        name                = each.value.capture_description.destination.name
        storage_account_id  = each.value.capture_description.destination.storage_account_id
      }
    }
  }


  depends_on = [azurerm_eventhub_namespace.this]
}


resource "azurerm_eventhub_consumer_group" "this" {
  for_each = try({
    for np in var.settings.azurerm_eventhub_consumer_group :
    "${np.eventhub_name}_${np.name}" => np
  }, {})

  name                = each.value.name
  namespace_name      = azurerm_eventhub_namespace.this.name
  eventhub_name       = each.value.eventhub_name
  resource_group_name = var.settings.resource_group_name
  user_metadata       = each.value.user_metadata

  depends_on = [azurerm_eventhub.this]
}

resource "azurerm_eventhub_namespace_authorization_rule" "this" {
  for_each            = try({ for np in var.settings.azurerm_eventhub_namespace_authorization_rule : np.name => np }, {})
  name                = each.key
  namespace_name      = azurerm_eventhub_namespace.this.name
  resource_group_name = var.settings.resource_group_name

  listen = each.value.listen
  send   = each.value.send
  manage = each.value.manage

  depends_on = [azurerm_eventhub_namespace.this]
}

resource "azurerm_eventhub_authorization_rule" "this" {
  for_each            = try({ for np in var.settings.azurerm_eventhub_authorization_rule : np.name => np }, {})
  name                = each.key
  namespace_name      = azurerm_eventhub_namespace.this.name
  eventhub_name       = each.value.eventhub_name
  resource_group_name = var.settings.resource_group_name
  listen              = true
  send                = false
  manage              = false
}

resource "azurerm_eventhub_namespace_schema_group" "this" {
  for_each             = try({ for np in var.settings.azurerm_eventhub_namespace_schema_group : np.name => np }, {})
  name                 = var.settings.azurerm_eventhub_namespace_schema_group.name
  namespace_id         = azurerm_eventhub_namespace.this.id
  schema_compatibility = var.settings.azurerm_eventhub_namespace_schema_group.schema_compatibility
  schema_type          = var.settings.azurerm_eventhub_namespace_schema_group.schema_type
}

resource "azurerm_private_endpoint" "this" {

  name                          = var.settings.private_endpoint.endpoint_name
  location                      = var.settings.location
  resource_group_name           = var.settings.resource_group_name
  subnet_id                     = var.settings.private_endpoint.subnet_id
  custom_network_interface_name = replace(var.settings.private_endpoint.endpoint_name, "pep-", "pepnic-")

  private_service_connection {
    name                           = var.settings.private_endpoint.connection_name
    private_connection_resource_id = azurerm_eventhub_namespace.this.id
    is_manual_connection           = false
    subresource_names              = ["namespace"]

  }

  private_dns_zone_group {
    name                 = "${var.settings.private_endpoint.endpoint_name}-dns-zone-group"
    private_dns_zone_ids = var.settings.private_endpoint.private_dns_zone_ids
  }
}
