data "azurerm_client_config" "core" {}
resource "azurerm_storage_account" "this" {
  name                            = var.settings.storageaccount_name
  resource_group_name             = var.settings.resource_group_name
  location                        = var.settings.location
  account_kind                    = var.settings.account_kind
  account_tier                    = var.settings.account_tier
  account_replication_type        = var.settings.account_replication_type
  allow_nested_items_to_be_public = false
  edge_zone                       = var.settings.edge_zone
  enable_https_traffic_only       = true
  min_tls_version                 = "TLS1_2"
  shared_access_key_enabled       = var.settings.shared_access_key_enabled
  tags                            = var.settings.tags
  large_file_share_enabled        = var.settings.large_file_share_enabled
  nfsv3_enabled                   = var.settings.nfsv3_enabled
  public_network_access_enabled   = var.settings.public_network_access_enabled
  # dns_endpoint_type               = var.settings.dns_endpoint_type
  blob_properties {
    container_delete_retention_policy {
      days = 7
    }
  }

  dynamic "static_website" {
    for_each = var.settings.static_website != null ? [var.settings.static_website] : []

    content {
      index_document     = static_website.value.index_document
      error_404_document = try(static_website.value.error_404_document, null)
    }
  }

  lifecycle {
    ignore_changes = [
      # static_website, 
      blob_properties[0]
    ]
  }
}

resource "azurerm_storage_account_network_rules" "this" {
  storage_account_id         = azurerm_storage_account.this.id
  virtual_network_subnet_ids = var.settings.network_rules.virtual_network_subnet_ids
  default_action             = "Deny"
  bypass                     = ["AzureServices"]
  ip_rules                   = var.settings.network_rules.ip_rules

  lifecycle {
    ignore_changes = [virtual_network_subnet_ids]
  }

}

resource "azurerm_storage_container" "this" {
  for_each              = try({ for c in var.settings.containers : c.name => c }, {})
  name                  = each.key
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = "private"
  #depends_on            = [azurerm_private_endpoint.pvtep_storage]
}

resource "azurerm_storage_share" "this" {
  for_each             = try({ for s in var.settings.file_shares : s.name => s }, {})
  name                 = each.key
  storage_account_name = azurerm_storage_account.this.name
  quota                = each.value.quota_in_gb
  enabled_protocol     = each.value.enabled_protocol
  metadata             = each.value.metadata

  dynamic "acl" {
    for_each = each.value.acl != null ? each.value.acl : []

    content {
      id = acl.value.id

      access_policy {
        permissions = acl.value.permissions
        start       = acl.value.start
        expiry      = acl.value.expiry
      }
    }
  }
}

resource "azurerm_storage_queue" "this" {
  for_each             = try({ for q in var.settings.queues : q.name => q }, {})
  name                 = each.key
  storage_account_name = azurerm_storage_account.this.name
}

resource "azurerm_storage_table" "this" {
  for_each             = try({ for t in var.settings.tables : t.name => t }, {})
  name                 = each.key
  storage_account_name = azurerm_storage_account.this.name
}

resource "azurerm_private_endpoint" "this" {
  name                          = var.settings.private_endpoint.endpoint_name
  location                      = var.settings.location
  resource_group_name           = var.settings.resource_group_name
  subnet_id                     = var.settings.private_endpoint.subnet_id
  custom_network_interface_name = replace(var.settings.private_endpoint.endpoint_name, "pep-", "pepnic-")
  private_service_connection {
    name                           = var.settings.private_endpoint.connection_name
    private_connection_resource_id = azurerm_storage_account.this.id
    is_manual_connection           = false
    subresource_names              = ["blob"]
  }

  private_dns_zone_group {
    name                 = "${var.settings.private_endpoint.endpoint_name}-dns-zone-group"
    private_dns_zone_ids = var.settings.private_endpoint.private_dns_zone_ids
  }
}


resource "azurerm_private_endpoint" "secondary" {
  for_each                      = try({ for n in var.settings.private_endpoint_secondary : n.endpoint_name => n }, {})
  name                          = each.key
  location                      = var.settings.location
  resource_group_name           = var.settings.resource_group_name
  subnet_id                     = each.value.subnet_id
  custom_network_interface_name = replace(each.key, "pep-", "pepnic-")
  private_service_connection {
    name                           = each.value.connection_name
    private_connection_resource_id = azurerm_storage_account.this.id
    is_manual_connection           = false
    subresource_names              = each.value.subresource_names
  }

  private_dns_zone_group {
    name                 = "${each.key}-dns-zone-group"
    private_dns_zone_ids = each.value.private_dns_zone_ids
  }
}

