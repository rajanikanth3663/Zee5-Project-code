locals {
  tenant_id = data.azuread_client_config.current.tenant_id
}
data "azuread_client_config" "current" {}

resource "azurerm_key_vault" "this" {
  name                            = var.settings.azurerm_key_vault_name
  location                        = var.settings.location
  resource_group_name             = var.settings.resource_group_name
  enabled_for_disk_encryption     = var.settings.enabled_for_disk_encryption
  tenant_id                       = var.settings.tenant_id
  soft_delete_retention_days      = 90
  purge_protection_enabled        = var.settings.purge_protection_enabled
  tags                            = var.settings.tags
  sku_name                        = var.settings.sku_name
  enabled_for_template_deployment = true
  enabled_for_deployment          = true
  enable_rbac_authorization       = true
  public_network_access_enabled   = false

  network_acls {
    bypass                     = "AzureServices"
    default_action             = var.settings.network_rules.default_action
    ip_rules                   = var.settings.network_rules.ip_rules
    virtual_network_subnet_ids = var.settings.network_rules.virtual_network_subnet_ids
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

resource "azurerm_private_endpoint" "this" {
  name                          = var.settings.private_endpoint.endpoint_name
  location                      = var.settings.location
  resource_group_name           = var.settings.resource_group_name
  subnet_id                     = var.settings.private_endpoint.subnet_id
  custom_network_interface_name = replace(var.settings.private_endpoint.endpoint_name, "pep-", "pepnic-")
  private_service_connection {
    name                           = var.settings.private_endpoint.connection_name
    private_connection_resource_id = azurerm_key_vault.this.id
    is_manual_connection           = false
    subresource_names              = ["vault"]
  }

  dynamic "private_dns_zone_group" {
    for_each = var.settings.private_endpoint.private_dns_zone_ids != null ? ["enabled"] : []
    content {
      name                 = "${var.settings.private_endpoint.endpoint_name}-dns-zone-group"
      private_dns_zone_ids = var.settings.private_endpoint.private_dns_zone_ids
    }

  }
}
