locals {
  configure_vnet_resources = {
    settings = {
      "vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001" = {
        name                = "vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
        location            = local.common.location
        resource_group_name = local.common.resource_group_name_csvc
        address_space       = ["10.173.0.0/17"]
        dns_servers         = ["168.63.129.16"]

        ddos_protection_plan = {
          id = "/subscriptions/${local.sec_subscription_id}/resourceGroups/rg-its-np-ci1-mgmt-0001/providers/Microsoft.Network/ddosProtectionPlans/ddosplan-its-np-ci1-sec-0001"
        }
        subnets = [
          {
            name             = "snet-${local.common.bu_name}-${local.common.dep_env}-ci1-apim-0001"
            address_prefixes = ["10.173.98.0/26"]
          },
          {
            name             = "snet-${local.common.bu_name}-${local.common.dep_env}-ci1-aks-0002"
            address_prefixes = ["10.173.64.0/19"]
          },
          {
            name             = "snet-${local.common.bu_name}-${local.common.dep_env}-ci1-aks-0003"
            address_prefixes = ["10.173.0.0/18"]
          },
          {
            name             = "snet-${local.common.bu_name}-${local.common.dep_env}-ci1-fappint-0004"
            address_prefixes = ["10.173.98.64/26"]
            delegation = {
              name                   = "serverFarms-delegation"
              service_delegated_name = "Microsoft.Web/serverFarms"
              actions                = ["Microsoft.Network/virtualNetworks/subnets/action"]
            }
          },
          {
            name             = "snet-${local.common.bu_name}-${local.common.dep_env}-ci1-fappint-0005"
            address_prefixes = ["10.173.98.128/26"]
            delegation = {
              name                   = "serverFarms-delegation"
              service_delegated_name = "Microsoft.Web/serverFarms"
              actions                = ["Microsoft.Network/virtualNetworks/subnets/action"]
            }
          },
          {
            name             = "snet-${local.common.bu_name}-${local.common.dep_env}-ci1-fappint-0006"
            address_prefixes = ["10.173.98.192/26"]
            delegation = {
              name                   = "serverFarms-delegation"
              service_delegated_name = "Microsoft.Web/serverFarms"
              actions                = ["Microsoft.Network/virtualNetworks/subnets/action"]
            }
          },
          {
            name              = "snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
            address_prefixes  = ["10.173.96.0/24"]
            service_endpoints = ["Microsoft.EventHub"]
          },
          {
            name              = "snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"
            address_prefixes  = ["10.173.97.0/25"]
            service_endpoints = ["Microsoft.Storage"]
          },
          {
            name             = "snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-mysql-0009"
            address_prefixes = ["10.173.97.128/28"]
            delegation = {
              name                   = "mysql-delegation"
              service_delegated_name = "Microsoft.DBforMySQL/flexibleServers"
              actions                = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
            }
          },
          {
            name             = "snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-psql-0010"
            address_prefixes = ["10.173.97.144/28"]
            delegation = {
              name                   = "postgres-delegation"
              service_delegated_name = "Microsoft.DBforPostgreSQL/flexibleServers"
              actions                = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
            }
            service_endpoints = ["Microsoft.Storage"]
          },
          {
            name             = "snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-mgsql-0011"
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
          },
          {
            name             = "snet-${local.common.bu_name}-${local.common.dep_env}-ci1-fappint-0012"
            address_prefixes = ["10.173.97.192/27"]
            delegation = {
              name                   = "serverFarms-delegation"
              service_delegated_name = "Microsoft.Web/serverFarms"
              actions                = ["Microsoft.Network/virtualNetworks/subnets/action"]
            }
          },
          {
            name             = "snet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-0001"
            address_prefixes = ["10.173.100.0/22"]
          },
          {
            name             = "snet-${local.common.bu_name}-${local.common.dep_env}-ci1-sch-0001"
            address_prefixes = ["10.173.104.0/22"]
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
      "vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-medthek-0001" = {
        name                = "vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-medthek-0001"
        location            = local.common.location
        resource_group_name = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-medthek-0001"
        address_space       = ["10.171.9.0/25"]
        dns_servers         = ["168.63.129.16"]
        ddos_protection_plan = {
          id = "/subscriptions/${local.sec_subscription_id}/resourceGroups/rg-its-np-ci1-mgmt-0001/providers/Microsoft.Network/ddosProtectionPlans/ddosplan-its-np-ci1-sec-0001"
        }
        subnets = [
          {
            name             = "snet-${local.common.bu_name}-${local.common.dep_env}-ci1-medthekapp-0001"
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
      # vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-sch-0001 = {
      #   name                = "vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-sch-0001"
      #   location            = local.common.location
      #   resource_group_name = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0003"
      #   address_space       = ["10.175.24.192/26", "10.175.25.128/26"]
      #   dns_servers         = ["168.63.129.16"]
      #   ddos_protection_plan = {
      #     id = "/subscriptions/${local.sec_subscription_id}/resourceGroups/rg-its-np-ci1-mgmt-0001/providers/Microsoft.Network/ddosProtectionPlans/ddosplan-its-np-ci1-sec-0001"
      #   }
      #   subnets = [
      #     {
      #       name             = "snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0001"
      #       address_prefixes = ["10.175.24.192/27"]
      #     },
      #     {
      #       name             = "snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0001"
      #       address_prefixes = ["10.175.24.224/27"]
      #     },
      #     {
      #       name             = "snet-${local.common.bu_name}-${local.common.dep_env}-ci1-fappint-0001"
      #       address_prefixes = ["10.175.25.128/26"]
      #       delegation = {
      #         name                   = "serverFarms-delegation"
      #         service_delegated_name = "Microsoft.Web/serverFarms"
      #         actions                = ["Microsoft.Network/virtualNetworks/subnets/action"]
      #       }
      #     }
      #   ]
      #   tags = {
      #     "service-name"       = ""
      #     "BusinessUnit"       = ""
      #     "CostCenter"         = ""
      #     "DisasterRecovery"   = ""
      #     "environment"        = ""
      #     "OwnerName"          = ""
      #     "servicecriticality" = ""
      #     "ISV"                = ""
      #     "DataClassification" = ""
      #     "service-family"     = ""
      #     "ticket-id"          = ""
      #     "lead-spoc"          = ""
      #     "created_by"         = ""
      #     "Created_Date"       = ""
      #     "Updated_Date"       = ""
      #   }
      # }
      "vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-ateme-0001" = {
        name                = "vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-ateme-0001"
        location            = local.common.location
        resource_group_name = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-ateme-0001"
        address_space       = ["10.175.32.0/21"]
        dns_servers         = ["168.63.129.16"]
        ddos_protection_plan = {
          id = "/subscriptions/${local.sec_subscription_id}/resourceGroups/rg-its-np-ci1-mgmt-0001/providers/Microsoft.Network/ddosProtectionPlans/ddosplan-its-np-ci1-sec-0001"
        }
        subnets = [
          {
            name             = "snet-${local.common.bu_name}-${local.common.dep_env}-ci1-atemeaks-0001"
            address_prefixes = ["10.175.32.0/21"]
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


    }
  }
}
