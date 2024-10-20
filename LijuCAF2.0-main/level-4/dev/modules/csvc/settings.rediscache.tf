locals {
  configure_rediscache_resources = {
    settings = {
      name                = "redis-ott007-dev-ci1-csss-0001"
      location            = "centralindia"
      resource_group_name = "rg-ott007-dev-ci1-csss-0001"
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
        endpoint_name   = "pep-ott007-np-ci1-csssredis-0001"
        subnet_id       = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-app-0007"
        connection_name = "redis-ott007-dev-ci1-csss-0001-pvt-connection"
      }
    }

    redissettings = {
      redissec = {
        name                = "redis-ott007-dev-ci1-csss-0002"
        location            = "centralindia"
        resource_group_name = "rg-ott007-dev-ci1-csss-0001"
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
          endpoint_name   = "pep-ott007-np-ci1-csssredis-0002"
          subnet_id       = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-app-0007"
          connection_name = "redis-ott007-dev-ci1-csss-0002-pvt-connection"
        }
      }
    }
  }
}