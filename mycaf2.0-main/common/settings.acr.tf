locals {
  configure_acr_resources = {
    settings = {
      "cr${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name_ateme}0001" = {
        name                      = "cr${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name_ateme}0001"
        location                  = local.common.location
        resource_group_name       = local.common.resource_group_name_ateme
        data_endpoint_enabled     = true
        images_retention_enabled  = true
        images_retention_days     = 10
        quarantine_policy_enabled = false
        private_endpoint = {
          endpoint_name        = "pep-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001"
          subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_ateme}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-atemeaks-0001"
          connection_name      = "pep-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001"
          private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/rg-${local.common.bu_name}-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.azurecr.io"]
        }
      }
    }
  }
}
