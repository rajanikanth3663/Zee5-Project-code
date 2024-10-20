locals {
  configure_postgres_resources = {
    settings = {
      location            = "centralindia"
      resource_group_name = "rg-ott007-dev-ci1-csss-0001"
      name                = "psql-ott007-dev-ci1-csss-0001"
      delegated_subnet_id = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-data-psql-0010"
      private_dns_zone_id = "/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.postgres.database.azure.com"
      sku_name            = "GP_Standard_D2s_v3"
      storage_mb          = "262144"

      authentication = {
        active_directory_auth_enabled = true
        password_auth_enabled         = true
        tenant_id                     = local.tenant_id
      }
      administrator_login                         = "psqladmin"
      administrator_password                      = "Bdspsqladmin@123"
      azurerm_postgresql_flexible_server_database = []
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
