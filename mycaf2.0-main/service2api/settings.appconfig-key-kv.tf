locals {
  configure_appconfig_kv_resources = {
    settings = {

      PG_PASSWORD = {
        configuration_store_id = local.configuration_store_id
        type                   = "vault"
        key                    = "PG_PASSWORD"
        vault_key_reference    = data.azurerm_key_vault_secret.key_vault_secrets["PG-PASSWORD"].versionless_id
        label                  = "cms-bulk-operations"
      }

      PG_USERNAME = {
        configuration_store_id = local.configuration_store_id
        type                   = "vault"
        key                    = "PG_USERNAME"
        vault_key_reference    = data.azurerm_key_vault_secret.key_vault_secrets["PG-USERNAME"].versionless_id
        label                  = "cms-bulk-operations"
      }

      JWTSecret = {
        configuration_store_id = local.configuration_store_id
        type                   = "vault"
        key                    = "JWTSecret"
        vault_key_reference    = data.azurerm_key_vault_secret.key_vault_secrets["jwtSecret"].versionless_id
        label                  = "cms-bulk-operations"
      }

      SASL_USERNAME = {
        configuration_store_id = local.configuration_store_id
        type                   = "vault"
        label                  = "cms-bulk-operations"
        key                    = "SASL_USERNAME"
        vault_key_reference    = data.azurerm_key_vault_secret.key_vault_secrets["KAFKA-EH2-USERNAME"].versionless_id
      }

      SASL_PASSWORD = {
        configuration_store_id = local.configuration_store_id
        type                   = "vault"
        label                  = "cms-bulk-operations"
        key                    = "SASL_PASSWORD"
        vault_key_reference    = data.azurerm_key_vault_secret.key_vault_secrets["KAFKA-EH2-PASSWORD"].versionless_id
      }

      BULK_OPS_SECRET_TOKEN = {
        configuration_store_id = local.configuration_store_id
        type                   = "vault"
        key                    = "BULK_OPS_SECRET_TOKEN"
        vault_key_reference    = data.azurerm_key_vault_secret.key_vault_secrets["BULK-OPS-SECRET-TOKEN"].versionless_id
        label                  = "cms-bulk-operations"
      }

      AZURE_STORAGE_CONNECTION_STRING = {
        configuration_store_id = local.configuration_store_id
        type                   = "vault"
        key                    = "AZURE_STORAGE_CONNECTION_STRING"
        vault_key_reference    = data.azurerm_key_vault_secret.key_vault_secrets["AZURE-STORAGE-CONNECTION-STRING002"].versionless_id
        label                  = "cms-bulk-operations"
      }

      VOD_API_SCRET_KEY = {
        configuration_store_id = local.configuration_store_id
        type                   = "vault"
        key                    = "VOD_API_SCRET_KEY"
        vault_key_reference    = data.azurerm_key_vault_secret.key_vault_secrets["VOD-API-SCRET-KEY"].versionless_id
        label                  = "cms-bulk-operations"
      }
    }
  }
}
