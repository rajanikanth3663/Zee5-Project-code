locals {
  configure_mysql_resources = {
    settings = {
      location            = "centralindia"
      resource_group_name = "rg-ott007-dev-ci1-csss-0001"
      name                = "mysql-ott007-dev-ci1-csss-0001"
      delegated_subnet_id = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-data-mysql-0009"
      private_dns_zone_id = "/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.mysql.database.azure.com"

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
      administrator_password = "Bdsmysqladmin@123"
    }
  }
}
