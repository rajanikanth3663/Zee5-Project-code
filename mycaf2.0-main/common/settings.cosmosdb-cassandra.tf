locals {
  configure_cosmosdb_cassandra_resources = {
    settings = {

      "cosmos-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001" = {
        name                = "cosmos-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
        location            = local.common.location
        resource_group_name = local.common.resource_group_name_csvc

        geo_location = [{
          location          = local.common.location
          failover_priority = 0
        }]

        capabilities = [{
          name = "EnableCassandra"
          }, {
          name = "EnableServerless"
        }]

        private_endpoint = [{
          endpoint_name        = "pep-${local.common.bu_name}-${local.common.dep_env}-ci1-csvccosmosdb-0001"
          subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"
          connection_name      = "pep-${local.common.bu_name}-${local.common.dep_env}-ci1-csvccosmosdb-0001"
          private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/rg-${local.common.bu_name}-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.cassandra.cosmos.azure.com"]
          subresource_names    = ["Cassandra"]
        }]

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
      "cosmos-${local.common.bu_name}-${local.common.dep_env}-ci1-cmsrss-0001" = {
        name                = "cosmos-${local.common.bu_name}-${local.common.dep_env}-ci1-cmsrss-0001"
        location            = local.common.location
        resource_group_name = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-rssfeed-001"

        geo_location = [{
          location          = local.common.location
          failover_priority = 0
        }]

        capabilities = [{
          name = "EnableCassandra"
          }, {
          name = "EnableServerless"
          },
          # {
          # name = "CassandraEnableMaterializedViews"
          # }
        ]

        private_endpoint = [{
          endpoint_name        = "pep-${local.common.bu_name}-${local.common.dep_env}-ci1-cmsrsscosmosdb-0001"
          subnet_id            = local.csvc_subnet_id["snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"]
          connection_name      = "pep-${local.common.bu_name}-${local.common.dep_env}-ci1-cmsrsscosmosdb-0001"
          private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/rg-${local.common.bu_name}-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.cassandra.cosmos.azure.com"]
          subresource_names    = ["Cassandra"]
        }]

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
