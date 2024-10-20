locals {
  configure_cosmosdb_mongodb_resources = {
    settings = {

      "cosmos-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0002" = {
        name                = "cosmos-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0002"
        location            = local.common.location
        resource_group_name = local.common.resource_group_name_csvc
        kind                = "MongoDB"

        geo_location = [{
          location          = local.common.location
          failover_priority = 0
        }]

        capabilities = [{
          name = "EnableMongo"
          }, {
          name = "EnableServerless"
        }]

        private_endpoint = [{
          endpoint_name        = "pep-${local.common.bu_name}-${local.common.dep_env}-ci1-csvccosmosdb-0002"
          subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"
          connection_name      = "pep-${local.common.bu_name}-${local.common.dep_env}-ci1-csvccosmosdb-0002"
          private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/${local.common.resource_group_name_hubdns}/providers/Microsoft.Network/privateDnsZones/privatelink.mongo.cosmos.azure.com"]
          subresource_names    = ["MongoDB"]
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
