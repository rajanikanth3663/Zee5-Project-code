data "azurerm_client_config" "current" {}
data "azurerm_client_config" "core" {}

data "azurerm_key_vault_secret" "key_vault_secrets" {
  for_each     = toset(local.key_vault_secrets)
  name         = each.value
  key_vault_id = local.bds_key_vault_id
}

data "azurerm_eventhub_namespace" "ehns_endpoint" {
  name                = "ehdedns-zee5-uat-ci1-hub-0001"
  resource_group_name = "rg-zee5-uat-ci1-csvc-0001"
}

data "azurerm_postgresql_flexible_server" "psqlendpoint" {
  name                = "psql-zee5-uat-ci1-cms-0001"
  resource_group_name = "rg-zee5-uat-ci1-cms-0001"
}
