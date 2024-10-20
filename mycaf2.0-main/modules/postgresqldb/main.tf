data "azurerm_client_config" "current" {}
resource "azurerm_postgresql_flexible_server_database" "this" {
  name      = var.settings.name
  server_id = var.settings.server_id
  collation = var.settings.collation
  charset   = var.settings.charset
}

