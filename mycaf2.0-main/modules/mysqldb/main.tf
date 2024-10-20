data "azurerm_client_config" "current" {}
resource "azurerm_mysql_flexible_database" "this" {
  name                = var.settings.name
  resource_group_name = var.settings.resource_group_name
  server_name         = var.settings.server_name
  collation           = var.settings.collation
  charset             = var.settings.charset
}

