resource "azurerm_route_table" "rt_sqlmi" {
  name                          = var.settings.route_table_name
  location                      = var.settings.location
  resource_group_name           = var.settings.resource_group_name
  disable_bgp_route_propagation = false
}

resource "azurerm_subnet_route_table_association" "example" {
  subnet_id      = var.settings.subnet_id
  route_table_id = azurerm_route_table.rt_sqlmi.id
}

resource "azurerm_mssql_managed_instance" "this" {
  name                         = var.settings.name
  resource_group_name          = var.settings.resource_group_name
  location                     = var.settings.location
  administrator_login          = var.settings.administrator_login
  administrator_login_password = var.settings.administrator_login_password
  license_type                 = var.settings.license_type
  subnet_id                    = var.settings.subnet_id
  sku_name                     = var.settings.sku_name
  vcores                       = var.settings.vcores
  storage_size_in_gb           = var.settings.storage_size_in_gb
  public_data_endpoint_enabled = var.settings.public_data_endpoint_enabled
  minimum_tls_version          = var.settings.minimum_tls_version
  proxy_override               = var.settings.proxy_override
  timezone_id                  = var.settings.timezone_id

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_mssql_managed_database" "this" {
  for_each            = try({ for n in var.settings.azurerm_sql_managed_database : n.name => n }, {})
  managed_instance_id = azurerm_mssql_managed_instance.this.id
  name                = each.key
}
