locals {
  configure_redisen_resources = {
    settings = {
      "redisen-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001" = {
        azurerm_redis_enterprise_cluster = [{
          name                = "redisen-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
          location            = local.common.location
          resource_group_name = local.common.resource_group_name_csvc
          sku_name            = "Enterprise_E20-4"
        }]

        azurerm_redis_enterprise_database = {
          name                = "default"
          cluster_id          = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Cache/redisEnterprise/redisen-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/"
          client_protocol     = "Encrypted"
          resource_group_name = local.common.resource_group_name_csvc
          clustering_policy   = "OSSCluster"
          eviction_policy     = "NoEviction"
          port                = 10000

          module = [{
            name = "RedisBloom"
            },
            {
              name = "RedisTimeSeries"
            },
            {
              name = "RedisJSON"
            },

          ]
        }

        private_endpoint = {
          endpoint_name        = "pep-${local.common.bu_name}-np-ci1-${local.common.app_name}redisen-0001"
          subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
          connection_name      = "redisen-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001-pvt-connection"
          private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/${local.common.resource_group_name_hubdns}/providers/Microsoft.Network/privateDnsZones/privatelink.redis.cache.windows.net"]
        }

      }

    }
  }
}
