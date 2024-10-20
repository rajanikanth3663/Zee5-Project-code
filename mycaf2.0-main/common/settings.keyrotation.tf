locals {
  configure_keyvault_keyrotation = {
    settings = {
      "key-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001" = {
        azurerm_key_name     = "STORAGE-KEY1"
        azurerm_key_value    = "1234"
        azurerm_key_vault_id = "/subscriptions/subs-******-******/resourceGroups/rg-xx77-dev-ci1-ve-0001/providers/Microsoft.KeyVault/vaults/kv-xx77-dev-ci1-ve-0001"
        expiration_date      = "2024-06-22T12:00:00Z"
        tags = {
          "ValidityPeriodDays" = 90
          "CredentialId"       = "key1"
          "ProviderAddress"    = "/subscriptions/subs-******-******/resourceGroups/rg-xx77-dev-ci1-ve-0001/providers/Microsoft.Storage/storageAccounts/stxx77devci1ve0001"
          "file-encoding"      = "utf-8"
        }
      }

    }
  }
}