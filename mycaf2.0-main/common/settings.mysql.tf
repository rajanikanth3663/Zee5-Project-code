locals {
  configure_mysql_resources = {
    settings = {
      "mysql-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001" = {
        location            = local.common.location
        resource_group_name = local.common.resource_group_name_csvc
        name                = "mysql-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
        sku_name            = "GP_Standard_D2ds_v4"
        delegated_subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-mysql-0009"
        private_dns_zone_id = "/subscriptions/${local.hub_subscription_id}/resourceGroups/${local.common.resource_group_name_hubdns}/providers/Microsoft.Network/privateDnsZones/privatelink.mysql.database.azure.com"

        tenant_id = local.tenant_id
        high_availability = {
          mode                      = "SameZone"
          standby_availability_zone = 2
        }
        azurerm_mysql_flexible_server_database = []
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
        administrator_login    = "mysqladmin"
        administrator_password = var.MYSQL_PASSWORD
      }
      "mysql-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_adtech}-0001" = {
        location            = local.common.location
        resource_group_name = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-adtek-0001"
        name                = "mysql-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_adtech}-0001"
        delegated_subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-mysql-0009"
        private_dns_zone_id = "/subscriptions/${local.hub_subscription_id}/resourceGroups/${local.common.resource_group_name_hubdns}/providers/Microsoft.Network/privateDnsZones/privatelink.mysql.database.azure.com"

        tenant_id = local.tenant_id
        high_availability = {
          mode                      = "SameZone"
          standby_availability_zone = 2
        }
        azurerm_mysql_flexible_server_database = []
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
        administrator_login    = "mysqladmin"
        administrator_password = "Adtechmysqladmin@123"
      }
    }
  }
}
