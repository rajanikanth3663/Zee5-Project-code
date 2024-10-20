locals {
  configure_appconfig_keys_resources = {
    settings = {
      LIVE_URL = {
        configuration_store_id = local.configuration_store_id
        key                    = "LIVE_URL"
        value                  = "apim-zee5-uat-ci1-csvc-0001.azure-api.net/cms"
        label                  = "cms-bulk-operations"
      }

      PG_HOST = {
        configuration_store_id = local.configuration_store_id
        key                    = "PG_HOST"
        value                  = local.postgress_jdbc_con_sring
        label                  = "cms-bulk-operations"
      }

      BOOTSTRAP_SERVERS = {
        configuration_store_id = local.configuration_store_id
        key                    = "BOOTSTRAP_SERVERS"
        value                  = "${local.EH_HOSTNAME}:9093"
        label                  = "cms-bulk-operations"
      }

      CMS_BULK_OPERATIONS_SENTINEL = {
        configuration_store_id = local.configuration_store_id
        key                    = "CMS_BULK_OPERATIONS_SENTINEL"
        value                  = timestamp()
        label                  = "cms-bulk-operations"
      }
    }
  }
}
