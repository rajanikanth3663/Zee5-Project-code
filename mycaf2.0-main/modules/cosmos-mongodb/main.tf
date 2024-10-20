resource "azurerm_cosmosdb_mongo_database" "this" {
  name                = var.settings.name
  resource_group_name = var.settings.resource_group_name
  account_name        = var.settings.account_name
  throughput          = var.settings.throughput
}