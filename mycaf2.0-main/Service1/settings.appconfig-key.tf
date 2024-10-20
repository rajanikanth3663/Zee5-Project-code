locals {
  configure_appconfig_keys_resources = {
    settings = {
      ZEE5_KAFKA_BROKERS = {
        configuration_store_id = local.configuration_store_id
        key                    = "ZEE5_KAFKA_BROKERS"
        value                  = "${local.EH_HOSTNAME}:9093"
        label                  = "aurora"
      }
      AURORA_SENTINEL = {
        configuration_store_id = local.configuration_store_id
        key                    = "AURORA_SENTINEL"
        value                  = timestamp()
        label                  = "aurora"
      }

    }


  }
}
