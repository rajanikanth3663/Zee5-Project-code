resource "azurerm_firewall_policy_rule_collection_group" "this" {
  name               = var.settings.name
  firewall_policy_id = var.settings.firewall_policy_id
  priority           = var.settings.priority

  dynamic "network_rule_collection" {
    for_each = var.settings.network_rule_collection != null ? { enabled = true } : {}
    content {
      name     = var.settings.network_rule_collection.name
      priority = var.settings.network_rule_collection.priority
      action   = var.settings.network_rule_collection.action
      dynamic "rule" {
        for_each = var.settings.network_rule_collection.rules != null ? var.settings.network_rule_collection.rules : []
        content {
          name                  = rule.value.name
          protocols             = rule.value.protocols
          source_addresses      = rule.value.source_addresses
          destination_addresses = rule.value.destination_addresses
          destination_ports     = rule.value.destination_ports
          destination_fqdns     = rule.value.destination_fqdns
        }
      }
    }
  }

  dynamic "application_rule_collection" {
    for_each = var.settings.application_rule_collection != null ? { enabled = true } : {}
    content {
      name     = var.settings.application_rule_collection.name
      priority = var.settings.application_rule_collection.priority
      action   = var.settings.application_rule_collection.action
      dynamic "rule" {
        for_each = var.settings.application_rule_collection.rules != null ? var.settings.application_rule_collection.rules : []

        content {
          dynamic "protocols" {
            for_each = rule.value.protocols != null ? rule.value.protocols : []

            content {
              type = protocols.value.type
              port = protocols.value.port
            }
          }
          name                  = rule.value.name
          source_addresses      = rule.value.source_addresses
          destination_fqdns     = rule.value.destination_fqdns
          destination_fqdn_tags = rule.value.destination_fqdn_tags
        }
      }
    }
  }

  dynamic "nat_rule_collection" {
    for_each = var.settings.nat_rule_collection != null ? { enabled = true } : {}
    content {
      name     = var.settings.nat_rule_collection.name
      priority = var.settings.nat_rule_collection.priority
      action   = var.settings.nat_rule_collection.action
      dynamic "rule" {
        for_each = var.settings.nat_rule_collection.rules != null ? var.settings.nat_rule_collection.rules : []
        content {
          name                = rule.value.name
          protocols           = rule.value.protocols
          source_addresses    = rule.value.source_addresses
          source_ip_groups    = rule.value.source_ip_groups
          destination_address = rule.value.destination_address
          destination_ports   = rule.value.destination_ports
          translated_address  = rule.value.translated_address
          translated_port     = rule.value.translated_port
          translated_fqdn     = rule.value.translated_fqdn
        }
      }
    }
  }
}
