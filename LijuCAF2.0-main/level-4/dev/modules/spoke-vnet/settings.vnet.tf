locals {
  vnet_configurations = {
    settings = [
      {
        name                = "vnet-ott007-dev-ci1-csss-0001"
        location            = "centralindia"
        resource_group_name = "rg-ott007-dev-ci1-csss-0001"
        address_space       = ["10.173.0.0/17"]
        dns_servers         = ["168.63.129.16"]
        subnets = [
          {
            name             = "snet-ott007-dev-ci1-apim-0001"
            address_prefixes = ["10.173.98.0/26"]
          },
          {
            name             = "snet-ott007-dev-ci1-aks-0002"
            address_prefixes = ["10.173.64.0/19"]
          },
          {
            name             = "snet-ott007-dev-ci1-aks-0003"
            address_prefixes = ["10.173.0.0/18"]
          },
          {
            name             = "snet-ott007-dev-ci1-fappint-0004"
            address_prefixes = ["10.173.98.64/26"]
            delegation = {
              name                   = "serverFarms-delegation"
              service_delegated_name = "Microsoft.Web/serverFarms"
              actions                = ["Microsoft.Network/virtualNetworks/subnets/action"]
            }
          },
          {
            name             = "snet-ott007-dev-ci1-fappint-0005"
            address_prefixes = ["10.173.98.128/26"]
            delegation = {
              name                   = "serverFarms-delegation"
              service_delegated_name = "Microsoft.Web/serverFarms"
              actions                = ["Microsoft.Network/virtualNetworks/subnets/action"]
            }
          },
          {
            name             = "snet-ott007-dev-ci1-fappint-0006"
            address_prefixes = ["10.173.98.192/26"]
            delegation = {
              name                   = "serverFarms-delegation"
              service_delegated_name = "Microsoft.Web/serverFarms"
              actions                = ["Microsoft.Network/virtualNetworks/subnets/action"]
            }
          },
          {
            name              = "snet-ott007-dev-ci1-app-0007"
            address_prefixes  = ["10.173.96.0/24"]
            service_endpoints = ["Microsoft.EventHub"]
          },
          {
            name              = "snet-ott007-dev-ci1-data-0008"
            address_prefixes  = ["10.173.97.0/25"]
            service_endpoints = ["Microsoft.Storage"]
          },
          {
            name             = "snet-ott007-dev-ci1-data-mysql-0009"
            address_prefixes = ["10.173.97.128/28"]
            delegation = {
              name                   = "mysql-delegation"
              service_delegated_name = "Microsoft.DBforMySQL/flexibleServers"
              actions                = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
            }
          },
          {
            name             = "snet-ott007-dev-ci1-data-psql-0010"
            address_prefixes = ["10.173.97.144/28"]
            delegation = {
              name                   = "postgres-delegation"
              service_delegated_name = "Microsoft.DBforPostgreSQL/flexibleServers"
              actions                = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
            }
          },
          {
            name             = "snet-ott007-dev-ci1-data-mgsql-0011"
            address_prefixes = ["10.173.97.160/27"]
            delegation = {
              name                   = "mgsql-delegation"
              service_delegated_name = "Microsoft.Sql/managedInstances"
              actions = [
                "Microsoft.Network/virtualNetworks/subnets/join/action",
                "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
                "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"
              ]
            }
          }
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
      },
      {
        name                = "vnet-ott007-dev-ci1-medthek-0001"
        location            = "centralindia"
        resource_group_name = "rg-ott007-dev-ci1-medthek-0001"
        address_space       = ["10.171.9.0/25"]
        dns_servers         = ["168.63.129.16"]
        subnets = [
          {
            name             = "snet-ott007-dev-ci1-medthekapp-0001"
            address_prefixes = ["10.171.9.0/26"]
          }
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
    ]
  }
}
