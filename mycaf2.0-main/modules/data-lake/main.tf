resource "azurerm_storage_account" "this" {
  name                            = var.settings.name
  resource_group_name             = var.settings.resource_group_name
  location                        = var.settings.location
  account_kind                    = var.settings.account_kind
  account_tier                    = var.settings.account_tier
  account_replication_type        = var.settings.account_replication_type
  is_hns_enabled                  = true
  enable_https_traffic_only       = true
  public_network_access_enabled   = var.settings.public_network_enabled
  allow_nested_items_to_be_public = true
  sftp_enabled                    = true
  tags                            = var.settings.tags
  # enable_blob_soft_delete        = true
  # soft_delete_retention_days      = var.settings.soft_delete_retention_days
}


resource "azurerm_storage_data_lake_gen2_filesystem" "this" {
  for_each           = try({ for c in var.settings.filesystem : c.name => c }, {})
  name               = each.key
  storage_account_id = azurerm_storage_account.this.id

  properties = {
    hello = "aGVsbG8="
  }
  dynamic "ace" {
    for_each = var.settings.ace_blocks != null ? var.settings.ace_blocks : []

    content {
      scope       = ace.value.scope
      type        = ace.value.type
      permissions = ace.value.permissions
    }
  }
}

resource "azurerm_storage_data_lake_gen2_path" "this" {
  for_each = { for path in var.settings.paths : path.name => path }

  storage_account_id = azurerm_storage_account.this.id
  filesystem_name    = each.value.file_system_name
  path               = each.value.path
  resource           = each.value.resource

  depends_on = [azurerm_storage_data_lake_gen2_filesystem.this]

}

resource "azurerm_storage_account_network_rules" "this" {
  storage_account_id         = azurerm_storage_account.this.id
  virtual_network_subnet_ids = var.settings.rules.virtual_network_subnet_ids
  default_action             = var.settings.rules.default_action
  bypass                     = var.settings.rules.bypass
}

resource "azurerm_storage_container" "this" {

  for_each              = try({ for c in var.settings.containers : c.name => c }, {})
  name                  = each.key
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = each.value.container_access_type
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

  lifecycle {
    precondition {
      condition     = each.value.enabled_protocol == "NFS" ? var.settings.account_tier == "Premium" : true
      error_message = "NFS file shares can only be enabled on Premium Storage Accounts."
    }
    precondition {
      condition     = var.settings.account_tier != "Premium" || each.value.quota_in_gb >= 100
      error_message = "File share quota must be at least 100Gb for Premium Storage Accounts."
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
  count = var.settings.private_endpoint_enabled == true ? length(var.settings.private_endpoint) : 0

  name                          = var.settings.private_endpoint[count.index].endpoint_name
  location                      = var.settings.location
  resource_group_name           = var.settings.resource_group_name
  subnet_id                     = var.settings.private_endpoint[count.index].subnet_id
  custom_network_interface_name = "pepnic-${var.settings.private_endpoint[count.index].endpoint_name}"

  private_service_connection {
    name                           = var.settings.private_endpoint[count.index].connection_name
    private_connection_resource_id = azurerm_storage_account.this.id
    is_manual_connection           = false
    subresource_names              = var.settings.private_endpoint[count.index].subresource_name
  }

  private_dns_zone_group {
    name                 = "private-dns-zone-group-${var.settings.private_endpoint[count.index].endpoint_name}"
    private_dns_zone_ids = var.settings.private_endpoint[count.index].private_dns_zone_ids
  }
}