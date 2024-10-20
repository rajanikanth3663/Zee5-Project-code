locals {
  configure_eventgrid_kv_resources = {
    settings = {
      "egst-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-kv-0001" = {
        name                   = "egst-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-kv-0001"
        location               = local.common.location
        resource_group_name    = "${local.common.resource_group_name_ve}"
        source_arm_resource_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_ve}/providers/Microsoft.KeyVault/vaults/kv-xx77-dev-ci1-ve-0001"
        topic_type             = "Microsoft.KeyVault.vaults"

        system_topic_event_subscription = [
          {
            name                 = "egsub-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-kv-0001"
            eventhub_endpoint_id = "/subscriptions/${local.sec_subscription_id}/resourceGroups/rg-its-np-ci1-mgmt-0001/providers/Microsoft.EventHub/namespaces/ehns-its-np-ci1-seckeyr-0001/eventhubs/evt_kv_secret_rotation"
            included_event_types = ["Microsoft.KeyVault.SecretNearExpiry"]
        }]
        private_endpoint = {
          endpoint_name        = "egstkv${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name_ve}0001-endpoint"
          subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
          connection_name      = "egstkv${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name_ve}0001-connection"
          private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/${local.common.resource_group_name_hubdns}/providers/Microsoft.Network/privateDnsZones/privatelink.eventgrid.azure.net"]
        }
      }
    }
  }
}