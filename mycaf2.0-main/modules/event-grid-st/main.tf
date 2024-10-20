resource "azurerm_eventgrid_system_topic" "this" {
  name                   = var.settings.name
  location               = var.settings.location
  resource_group_name    = var.settings.resource_group_name
  source_arm_resource_id = var.settings.source_arm_resource_id
  topic_type             = var.settings.topic_type
  identity {
    type         = var.settings.identity.type
    identity_ids = var.settings.identity.type == "UserAssigned" ? var.settings.identity.identity_ids : []
  }
  tags = var.settings.tags
}
resource "azurerm_role_assignment" "this" {
  for_each             = try({ for n in var.settings.azurerm_role_assignment : n.name => n }, {})
  scope                = each.value.scope
  role_definition_name = each.value.role_definition_name
  principal_id         = azurerm_eventgrid_system_topic.this.identity[0].principal_id
  depends_on           = [azurerm_eventgrid_system_topic.this]
}

resource "azurerm_eventgrid_system_topic_event_subscription" "this" {
  for_each                      = try({ for n in var.settings.system_topic_event_subscription : n.name => n }, {})
  name                          = each.key
  system_topic                  = azurerm_eventgrid_system_topic.this.name
  resource_group_name           = var.settings.resource_group_name
  service_bus_queue_endpoint_id = each.value.service_bus_queue_endpoint_id
  eventhub_endpoint_id          = each.value.eventhub_endpoint_id
  included_event_types          = each.value.included_event_types

  delivery_identity {
    type                   = var.settings.identity.type
    user_assigned_identity = var.settings.identity.type == "UserAssigned" ? var.settings.identity.identity_ids[0] : null
  }

  dynamic "advanced_filter" {
    for_each = each.value.advanced_filter != null ? each.value.advanced_filter : []
    content {
      dynamic "string_begins_with" {
        for_each = advanced_filter.value.string_begins_with != null ? advanced_filter.value.string_begins_with : []
        content {
          key    = string_begins_with.value.key
          values = string_begins_with.value.values
        }
      }
      dynamic "string_ends_with" {
        for_each = advanced_filter.value.string_ends_with != null ? advanced_filter.value.string_ends_with : []
        content {
          key    = string_ends_with.value.key
          values = string_ends_with.value.values
        }
      }
    }
  }

  depends_on = [azurerm_eventgrid_system_topic.this, azurerm_role_assignment.this]

}




# resource "azurerm_private_endpoint" "this" {
#   name                          = var.settings.private_endpoint.endpoint_name
#   location                      = var.settings.location
#   resource_group_name           = var.settings.resource_group_name
#   subnet_id                     = var.settings.private_endpoint.subnet_id
#   custom_network_interface_name = replace(var.settings.private_endpoint.endpoint_name, "pep-", "pepnic-")
#   private_service_connection {
#     name                           = var.settings.private_endpoint.connection_name
#     private_connection_resource_id = azurerm_eventgrid_system_topic.this.id
#     is_manual_connection           = false
#     subresource_names              = ["topic"]
#   }
#   private_dns_zone_group {
#     name                 = "${var.settings.private_endpoint.endpoint_name}-dns-zone-group"
#     private_dns_zone_ids = var.settings.private_endpoint.private_dns_zone_ids
#   }
# }
