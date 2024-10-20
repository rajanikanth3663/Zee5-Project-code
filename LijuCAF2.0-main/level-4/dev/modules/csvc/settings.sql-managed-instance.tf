locals {
  configure_sql_managed_instance_resources = {
    settings = {
      name                         = "sqlmi-ott007-dev-ci1-csss-0001"
      location                     = "centralindia"
      resource_group_name          = "rg-ott007-dev-ci1-csss-0001"
      administrator_login          = "csssdevadmin"
      administrator_login_password = "C5vc@dmin"
      sku_name                     = "GP_Gen5"

      #subnet with service delegation "Microsoft.Sql/managedInstances"
      subnet_id                    = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-data-mgsql-0011"
      subnet_CIDR                  = "10.173.97.160/27" #cidr of the subnet
      vcores                       = 4
      storage_size_in_gb           = 32
      public_data_endpoint_enabled = false
      minimum_tls_version          = 1.2
      timezone_id                  = "UTC"

      #this will create the new security group associate to subnet
      network_security_group_name  = "nsg-ott007-dev-ci1-data-mgsql-0011"
      azurerm_sql_managed_database = []
      route_table_name             = "rt-ott007-dev-ci1-cssssqlmi-0001"
    }
  }
}
