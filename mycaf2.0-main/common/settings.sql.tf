locals {
  sql_tags = {
    "ApplicationName"    = ""
    "BusinessUnit"       = ""
    "CostCenter"         = ""
    "Description"        = ""
    "DisasterRecovery"   = ""
    "environment"        = ""
    "OwnerName"          = ""
    "RequesterName"      = ""
    "ServiceClass"       = ""
    "ISV"                = ""
    "DataClassification" = ""
  }

  configure_mssql_resources = {
    settings = {
      "sqlsvr-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001" = {
        location               = local.common.location
        resource_group_name    = local.common.resource_group_name_csvc
        name                   = "sqlsvr-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
        managed_identity       = "id-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
        administrator_login    = "sqladmin"
        administrator_password = var.SQLMI_PASSWORD

        elasticpool = {
          name = "sqlsvr-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
          per_database_settings = {
          }
          sku = {
          }
        }

        virtual_network_rule = [
          {
            name      = "vnetrule_sql_data"
            subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"
          }
        ]

        mssql_database = [
          {
            name        = "sqldb-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
            max_size_gb = 32
            sku_name    = "GP_Gen5_2"
            read_scale  = false
          },
        ]
        tags                     = local.sql_tags
        private_endpoint_enabled = true
        private_endpoint = {
          endpoint_name        = "pep-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsql-0001"
          subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"
          connection_name      = "pep-${local.common.bu_name}-${local.common.dep_env}-ci1-datasql-0001"
          private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/${local.common.resource_group_name_hubdns}/providers/Microsoft.Network/privateDnsZones/privatelink.database.windows.net"]
        }

      }
    }
  }
}
