locals {
  configure_appconfig_kv_resources = {
    settings = {
      PAYMENT_ISC_KEY = {
        configuration_store_id = local.configuration_store_id
        type                   = "vault"
        label                  = "aurora"
        key                    = "PAYMENT_ISC_KEY"
        vault_key_reference    = data.azurerm_key_vault_secret.key_vault_secrets["PAYMENT-ISC-KEY"].versionless_id
      }

      PLAY_STORE_CLIENT_ID = {
        configuration_store_id = local.configuration_store_id
        type                   = "vault"
        label                  = "aurora"
        key                    = "PLAY_STORE_CLIENT_ID"
        vault_key_reference    = data.azurerm_key_vault_secret.key_vault_secrets["PLAY-STORE-CLIENT-ID"].versionless_id
      }
      PLAY_STORE_CLIENT_SECRET = {
        configuration_store_id = local.configuration_store_id
        type                   = "vault"
        label                  = "aurora"
        key                    = "PLAY_STORE_CLIENT_SECRET"
        vault_key_reference    = data.azurerm_key_vault_secret.key_vault_secrets["PLAY-STORE-CLIENT-SECRET"].versionless_id
      }
      PLAY_STORE_REFRESH_TOKEN = {
        configuration_store_id = local.configuration_store_id
        type                   = "vault"
        label                  = "aurora"
        key                    = "PLAY_STORE_REFRESH_TOKEN"
        vault_key_reference    = data.azurerm_key_vault_secret.key_vault_secrets["PLAY-STORE-REFRESH-TOKEN"].versionless_id
      }
      APPLE_SECRET_KEY = {
        configuration_store_id = local.configuration_store_id
        type                   = "vault"
        label                  = "aurora"
        key                    = "APPLE_SECRET_KEY"
        vault_key_reference    = data.azurerm_key_vault_secret.key_vault_secrets["APPLE-SECRET-KEY"].versionless_id
      }
      JUSPAY_AUTH_KEY = {
        configuration_store_id = local.configuration_store_id
        type                   = "vault"
        label                  = "aurora"
        key                    = "JUSPAY_AUTH_KEY"
        vault_key_reference    = data.azurerm_key_vault_secret.key_vault_secrets["JUSPAY-AUTH-KEY"].versionless_id
      }
      KAFKA_USERNAME = {
        configuration_store_id = local.configuration_store_id
        type                   = "vault"
        label                  = "aurora"
        key                    = "KAFKA_USERNAME"
        vault_key_reference    = data.azurerm_key_vault_secret.key_vault_secrets["KAFKA-USERNAME"].versionless_id
      }
      KAFKA_PASSWORD = {
        configuration_store_id = local.configuration_store_id
        type                   = "vault"
        label                  = "aurora"
        key                    = "KAFKA_PASSWORD"
        vault_key_reference    = data.azurerm_key_vault_secret.key_vault_secrets["KAFKA-PASSWORD"].versionless_id
      }
      KAFKA_REQUEST_TIMEOUT = {
        configuration_store_id = local.configuration_store_id
        type                   = "vault"
        label                  = "aurora"
        key                    = "KAFKA_REQUEST_TIMEOUT"
        vault_key_reference    = data.azurerm_key_vault_secret.key_vault_secrets["KAFKA-REQUEST-TIMEOUT"].versionless_id
      }
      ADYEN_API_KEY = {
        configuration_store_id = local.configuration_store_id
        type                   = "vault"
        label                  = "aurora"
        key                    = "ADYEN_API_KEY"
        vault_key_reference    = data.azurerm_key_vault_secret.key_vault_secrets["ADYEN-API-KEY"].versionless_id
      }

    }


  }
}
