locals {
  configuration_store_id = "/subscriptions/951bb481-cd31-4ad0-add8-6914f12d4849/resourceGroups/rg-zee5-uat-ci1-csvc-0001/providers/Microsoft.AppConfiguration/configurationStores/appconfig-zee5-uat-ci1-csvc-0001"
  bds_key_vault_id       = "/subscriptions/951bb481-cd31-4ad0-add8-6914f12d4849/resourceGroups/rg-zee5-uat-ci1-csvc-0001/providers/Microsoft.KeyVault/vaults/kv-zee5-uat-ci1-csvc-001"

  key_vault_secrets = [
    "PAYMENT-ISC-KEY",
    "PLAY-STORE-CLIENT-ID",
    "PLAY-STORE-CLIENT-SECRET",
    "PLAY-STORE-REFRESH-TOKEN",
    "APPLE-SECRET-KEY",
    "JUSPAY-AUTH-KEY",
    "KAFKA-USERNAME",
    "KAFKA-PASSWORD",
    "KAFKA-REQUEST-TIMEOUT",
    "ADYEN-API-KEY"
  ]
  EH_HOSTNAME = format("%s.servicebus.windows.net", data.azurerm_eventhub_namespace.ehns_endpoint.name)
}
