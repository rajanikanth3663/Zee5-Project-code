locals {
  configure_cognitivesearch_resources = {
    settings = {
      "ais-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001" = {
        name                = "ais-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
        location            = local.common.location
        resource_group_name = local.common.resource_group_name_csvc
        sku                 = "standard"
        replica_count       = "1"
        partition_count     = "1"

        private_endpoint = {
          endpoint_name        = "pep-ais-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
          subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
          connection_name      = "csvcsearch-pvt-connection"
          private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/${local.common.resource_group_name_hubdns}/providers/Microsoft.Network/privateDnsZones/privatelink.search.windows.net"]
        }
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

      }


    }
  }
}
