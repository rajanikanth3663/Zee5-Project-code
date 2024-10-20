locals {
  configuration_store_id = "/subscriptions/951bb481-cd31-4ad0-add8-6914f12d4849/resourceGroups/rg-zee5-uat-ci1-csvc-0001/providers/Microsoft.AppConfiguration/configurationStores/appconfig-zee5-uat-ci1-csvc-0001"
  bds_key_vault_id       = "/subscriptions/951bb481-cd31-4ad0-add8-6914f12d4849/resourceGroups/rg-zee5-uat-ci1-csvc-0001/providers/Microsoft.KeyVault/vaults/kv-zee5-uat-ci1-csvc-001"
  key_vault_secrets = [
    "PG-PASSWORD",
    "PG-USERNAME",
    "jwtSecret",
    "CORALOGIX-PRIVATE-KEY",
    "KAFKA-EH2-USERNAME",
    "KAFKA-EH2-PASSWORD",
    "BULK-OPS-SECRET-TOKEN",
    "AZURE-STORAGE-CONNECTION-STRING002",
    "VOD-API-SCRET-KEY"
  ]
  EH_HOSTNAME              = format("%s.servicebus.windows.net", data.azurerm_eventhub_namespace.ehns_endpoint.name)
  postgress_jdbc_con_sring = data.azurerm_postgresql_flexible_server.psqlendpoint.fqdn

}
