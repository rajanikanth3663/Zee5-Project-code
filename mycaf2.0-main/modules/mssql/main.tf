locals {
  configure_managed_identity = {
    settings = {
      name                = var.settings.name
      resource_group_name = var.settings.resource_group_name
      location            = var.settings.location
    }
  }
}

resource "azurerm_user_assigned_identity" "managed-identity" {
  name                = var.settings.managed_identity
  resource_group_name = var.settings.resource_group_name
  location            = var.settings.location

  tags = var.settings.tags
}

resource "azurerm_mssql_server" "this" {
  name                                 = var.settings.name
  resource_group_name                  = var.settings.resource_group_name
  location                             = var.settings.location
  version                              = var.settings.version
  connection_policy                    = var.settings.connection_policy
  minimum_tls_version                  = var.settings.minimum_tls_version
  public_network_access_enabled        = false
  outbound_network_restriction_enabled = false
  administrator_login                  = var.settings.administrator_login
  administrator_login_password         = var.settings.administrator_password


  # azuread_administrator {
  #   # login_username              = azurerm_user_assigned_identity.managed-identity.name
  #   # object_id                   = azurerm_user_assigned_identity.managed-identity.principal_id
  #   azuread_authentication_only = false
  # }

  # identity {
  #   type = "SystemAssigned"
  # }

  tags = var.settings.tags
  #depends_on = [module.managed-identity]
  depends_on = [azurerm_user_assigned_identity.managed-identity]
}

resource "azurerm_mssql_virtual_network_rule" "this" {
  for_each  = try({ for subnet in var.settings.virtual_network_rule.subnet_id : subnet.name => subnet }, {})
  name      = each.key
  server_id = azurerm_mssql_server.this.id
  subnet_id = each.value.subnet_id
}

resource "azurerm_mssql_database" "this" {
  for_each       = try({ for n in var.settings.mssql_database : n.name => n }, {})
  name           = each.key
  server_id      = azurerm_mssql_server.this.id
  collation      = each.value.collation
  license_type   = each.value.license_type
  max_size_gb    = each.value.max_size_gb
  read_scale     = each.value.read_scale
  sku_name       = each.value.sku_name
  zone_redundant = false
  tags           = var.settings.tags
}

resource "azurerm_private_endpoint" "this" {
  count                         = var.settings.private_endpoint_enabled == true ? 1 : 0
  name                          = var.settings.private_endpoint.endpoint_name
  location                      = var.settings.location
  resource_group_name           = var.settings.resource_group_name
  subnet_id                     = var.settings.private_endpoint.subnet_id
  custom_network_interface_name = replace(var.settings.private_endpoint.endpoint_name, "pep-", "pepnic-")


  private_service_connection {
    name                           = var.settings.private_endpoint.connection_name
    private_connection_resource_id = azurerm_mssql_server.this.id
    is_manual_connection           = false
    subresource_names              = ["sqlServer"]
  }

  private_dns_zone_group {
    name                 = "${var.settings.private_endpoint.endpoint_name}-dns-zone-group"
    private_dns_zone_ids = var.settings.private_endpoint.private_dns_zone_ids
  }
}