locals {
  configure_rediscache_resources = {
    settings = {
      "redis-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001" = {
        name                = "redis-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
        location            = local.common.location
        resource_group_name = local.common.resource_group_name_csvc
        capacity            = 1
        sku_name            = "Premium"
        tags = {
          "service-name"       = ""
          "BusinessUnit"       = ""
          "CostCenter"         = ""
          "DisasterRecovery"   = ""
          "environment"        = ""
          "OwnerName"          = ""
          "servicecriticality" = ""
          "ISV"                = ""
          "DataClassification" = ""
          "service-family"     = ""
          "ticket-id"          = ""
          "lead-spoc"          = ""
          "created_by"         = ""
          "Created_Date"       = ""
          "Updated_Date"       = ""
        }
        private_endpoint = {
          endpoint_name = "pep-${local.common.bu_name}-np-ci1-csvcredis-0001"
          subnet_id     = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"

          connection_name      = "redis-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001-pvt-connection"
          private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/${local.common.resource_group_name_hubdns}/providers/Microsoft.Network/privateDnsZones/privatelink.redis.cache.windows.net"]
        }
      }
      "redis-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0002" = {
        name                = "redis-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0002"
        location            = local.common.location
        resource_group_name = local.common.resource_group_name_csvc
        capacity            = 1
        sku_name            = "Premium"
        tags = {
          "service-name"       = ""
          "BusinessUnit"       = ""
          "CostCenter"         = ""
          "DisasterRecovery"   = ""
          "environment"        = ""
          "OwnerName"          = ""
          "servicecriticality" = ""
          "ISV"                = ""
          "DataClassification" = ""
          "service-family"     = ""
          "ticket-id"          = ""
          "lead-spoc"          = ""
          "created_by"         = ""
          "Created_Date"       = ""
          "Updated_Date"       = ""
        }
        private_endpoint = {
          endpoint_name        = "pep-${local.common.bu_name}-np-ci1-${local.common.app_name}redis-0002"
          subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
          connection_name      = "redis-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0002-pvt-connection"
          private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/${local.common.resource_group_name_hubdns}/providers/Microsoft.Network/privateDnsZones/privatelink.redis.cache.windows.net"]
        }
      }
      "redis-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_adtech}-0001" = {
        name                = "redis-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_adtech}-0001"
        location            = local.common.location
        resource_group_name = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-adtek-0001"
        capacity            = 1
        sku_name            = "Premium"
        tags = {
          "service-name"       = ""
          "BusinessUnit"       = ""
          "CostCenter"         = ""
          "DisasterRecovery"   = ""
          "environment"        = ""
          "OwnerName"          = ""
          "servicecriticality" = ""
          "ISV"                = ""
          "DataClassification" = ""
          "service-family"     = ""
          "ticket-id"          = ""
          "lead-spoc"          = ""
          "created_by"         = ""
          "Created_Date"       = ""
          "Updated_Date"       = ""
        }
        private_endpoint = {
          endpoint_name        = "pep-${local.common.bu_name}-np-ci1-adtechredis-0001"
          subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
          connection_name      = "redis-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_adtech}-0001-pvt-connection"
          private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/${local.common.resource_group_name_hubdns}/providers/Microsoft.Network/privateDnsZones/privatelink.redis.cache.windows.net"]
        }

      }
    }
  }
}
