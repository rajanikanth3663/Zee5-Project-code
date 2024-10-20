locals {
  configure_postgres_resources = {
    settings = {
      "psql-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001" = {
        location            = local.common.location
        resource_group_name = local.common.resource_group_name_csvc
        name                = "psql-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
        delegated_subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-psql-0010"
        private_dns_zone_id = "/subscriptions/${local.hub_subscription_id}/resourceGroups/${local.common.resource_group_name_hubdns}/providers/Microsoft.Network/privateDnsZones/privatelink.postgres.database.azure.com"
        sku_name            = "GP_Standard_D2s_v3"
        storage_mb          = "262144"

        authentication = {
          active_directory_auth_enabled = true
          password_auth_enabled         = true
          tenant_id                     = local.tenant_id
        }
        administrator_login    = "psqladmin"
        administrator_password = var.POSTGRES_PASSWORD
        azurerm_postgresql_flexible_server_database = [

        ]
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
