locals {
  default_nsg_rules = {
    AllowAzureLoadBalancer = {
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "AzureLoadBalancer"
      destination_address_prefix = "*"
      priority                   = 4095
      access                     = "Allow"
      direction                  = "Inbound"
      protocol                   = "*"
    },
    # AllowInboundApplicationAccess = {
    #   source_port_range          = "*"
    #   destination_port_ranges    = [443, 1433, 6380, 9180, 27017, 445, 22, 5432, 1433, 3306, 9092, 8983]
    #   source_address_prefix      = "10.173.0.0/17"
    #   destination_address_prefix = "10.173.0.0/17"
    #   priority                   = 200
    #   access                     = "Allow"
    #   direction                  = "Inbound"
    #   protocol                   = "*"
    # },
    # AllowOutboundApplicationAccess = {
    #   source_port_range          = "*"
    #   destination_port_ranges    = [443, 1433, 6380, 9180, 27017, 445, 22, 5432, 1433, 3306, 9092, 8983]
    #   source_address_prefix      = "10.173.0.0/17"
    #   destination_address_prefix = "10.173.0.0/17"
    #   priority                   = 200
    #   access                     = "Allow"
    #   direction                  = "Outbound"
    #   protocol                   = "*"
    # },
    AllowVnetInBound = {
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
      priority                   = 400
      access                     = "Allow"
      direction                  = "Inbound"
      protocol                   = "*"
    },
    AllowVnetOutBound = {
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
      priority                   = 400
      access                     = "Allow"
      direction                  = "Outbound"
      protocol                   = "*"
    },
    DenyAllInBound = {
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "Internet"
      destination_address_prefix = "*"
      priority                   = 4096
      access                     = "Deny"
      direction                  = "Inbound"
      protocol                   = "*"
    },
    DenyAllOutBound = {
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "Internet"
      priority                   = 4096
      access                     = "Deny"
      direction                  = "Outbound"
      protocol                   = "*"
  } }
  configure_nsg_resources = {
    settings = [
      {
        name                = "nsg-ott007-dev-ci1-apim-0001"
        location            = "centralindia"
        resource_group_name = "rg-ott007-dev-ci1-csss-0001"
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
        },
        subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-apim-0001"
        security_rule = merge(local.default_nsg_rules, {
          # "nsgr-ott007-dev-ci1-apim-jump-0001" = {
          #   source_port_range          = "*"
          #   destination_port_range     = 443
          #   source_address_prefixes    = ["10.171.42.197", "10.171.42.198"]
          #   destination_address_prefix = "10.173.98.0/26"
          #   priority                   = 500
          #   access                     = "Allow"
          #   direction                  = "Inbound"
          #   protocol                   = "*"
          # },
          "nsgr-ott007-dev-ci1-apim-builtin-0002" = {
            source_port_range          = "*"
            destination_port_ranges    = [80, 443]
            source_address_prefix      = "Internet"
            destination_address_prefix = "VirtualNetwork"
            priority                   = 501
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "Tcp"
          },
          "nsgr-ott007-dev-ci1-apim-builtin-0003" = {
            source_port_range          = "*"
            destination_port_range     = 3443
            source_address_prefix      = "ApiManagement"
            destination_address_prefix = "VirtualNetwork"
            priority                   = 502
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "Tcp"
          },
          "nsgr-ott007-dev-ci1-apim-builtin-0004" = {
            source_port_range          = "*"
            destination_port_range     = 443
            source_address_prefix      = "VirtualNetwork"
            destination_address_prefix = "Storage"
            priority                   = 500
            access                     = "Allow"
            direction                  = "Outbound"
            protocol                   = "Tcp"
          },
          "nsgr-ott007-dev-ci1-apim-builtin-0005" = {
            source_port_range          = "*"
            destination_port_range     = 1433
            source_address_prefix      = "VirtualNetwork"
            destination_address_prefix = "Sql"
            priority                   = 501
            access                     = "Allow"
            direction                  = "Outbound"
            protocol                   = "Tcp"
          },
          "nsgr-ott007-dev-ci1-apim-builtin-0006" = {
            source_port_range          = "*"
            destination_port_range     = 443
            source_address_prefix      = "VirtualNetwork"
            destination_address_prefix = "AzureKeyVault"
            priority                   = 502
            access                     = "Allow"
            direction                  = "Outbound"
            protocol                   = "Tcp"
          },
          "nsgr-ott007-dev-ci1-apim-builtin-0007" = {
            source_port_range          = "*"
            destination_port_ranges    = [1886, 443]
            source_address_prefix      = "VirtualNetwork"
            destination_address_prefix = "AzureMonitor"
            priority                   = 503
            access                     = "Allow"
            direction                  = "Outbound"
            protocol                   = "Tcp"
          },
          "nsgr-ott007-dev-ci1-apim-builtin-0008" = {
            source_port_range          = "*"
            destination_port_range     = 443
            source_address_prefix      = "VirtualNetwork"
            destination_address_prefix = "AzureActiveDirectory"
            priority                   = 504
            access                     = "Allow"
            direction                  = "Outbound"
            protocol                   = "Tcp"
          },
          "nsgr-ott007-dev-ci1-apim-builtin-0009" = {
            source_port_range          = "*"
            destination_port_range     = 443
            source_address_prefix      = "VirtualNetwork"
            destination_address_prefix = "AzureConnectors"
            priority                   = 505
            access                     = "Allow"
            direction                  = "Outbound"
            protocol                   = "Tcp"
          },
          "nsgr-ott007-dev-ci1-apim-builtin-0010" = {
            source_port_range            = "*"
            destination_port_range       = 443
            source_address_prefix        = "*"
            destination_address_prefixes = ["104.16.252.70", "104.16.253.70"]
            priority                     = 506
            access                       = "Allow"
            direction                    = "Outbound"
            protocol                     = "Tcp"
          }
        })
      },
      {
        name                = "nsg-ott007-dev-ci1-aks-0002"
        location            = "centralindia"
        resource_group_name = "rg-ott007-dev-ci1-csss-0001"
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
        subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-aks-0002"
        security_rule = merge(local.default_nsg_rules, {
          # "nsgr-ott007-dev-ci1-aks-jump-0001" = {
          #   source_port_range          = "*"
          #   destination_port_range     = "443"
          #   source_address_prefixes    = ["10.171.42.197", "10.171.42.198"]
          #   destination_address_prefix = "10.173.64.0/19"
          #   priority                   = 500
          #   access                     = "Allow"
          #   direction                  = "Inbound"
          #   protocol                   = "*"
          # }
        })
      },
      {
        name                = "nsg-ott007-dev-ci1-aks-0003"
        location            = "centralindia"
        resource_group_name = "rg-ott007-dev-ci1-csss-0001"
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
        subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-aks-0003"
        security_rule = merge(local.default_nsg_rules, {
          "nsgr-ott007-dev-ci1-aks-jump-0001" = {
            source_port_range          = "*"
            destination_port_range     = "443"
            source_address_prefixes    = ["10.171.42.197", "10.171.42.198"]
            destination_address_prefix = "10.173.0.0/18"
            priority                   = 500
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          }
        })
      },
      {
        name                = "nsg-ott007-dev-ci1-fappint-0004"
        location            = "centralindia"
        resource_group_name = "rg-ott007-dev-ci1-csss-0001"
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
        subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-fappint-0004"
        security_rule = merge(local.default_nsg_rules, {
          "nsgr-ott007-dev-ci1-fappint-jump-0001" = {
            source_port_range          = "*"
            destination_port_range     = "443"
            source_address_prefixes    = ["10.171.42.197", "10.171.42.198"]
            destination_address_prefix = "10.173.98.64/26"
            priority                   = 500
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          }
        })
      },
      {
        name                = "nsg-ott007-dev-ci1-fappint-0005"
        location            = "centralindia"
        resource_group_name = "rg-ott007-dev-ci1-csss-0001"
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
        subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-fappint-0005"
        security_rule = merge(local.default_nsg_rules, {
          "nsgr-ott007-dev-ci1-fappint-jump-0001" = {
            source_port_range          = "*"
            destination_port_range     = "443"
            source_address_prefixes    = ["10.171.42.197", "10.171.42.198"]
            destination_address_prefix = "10.173.98.128/26"
            priority                   = 500
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          }
        })
      },
      {
        name                = "nsg-ott007-dev-ci1-fappint-0006"
        location            = "centralindia"
        resource_group_name = "rg-ott007-dev-ci1-csss-0001"
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
        subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-fappint-0006"
        security_rule = merge(local.default_nsg_rules, {
          "nsgr-ott007-dev-ci1-fappint-jump-0001" = {
            source_port_range          = "*"
            destination_port_range     = "443"
            source_address_prefixes    = ["10.171.42.197", "10.171.42.198"]
            destination_address_prefix = "10.173.98.192/26"
            priority                   = 500
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          }
        })
      },
      {
        name                = "nsg-ott007-dev-ci1-app-0007"
        location            = "centralindia"
        resource_group_name = "rg-ott007-dev-ci1-csss-0001"
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
        subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-app-0007"
        security_rule = merge(local.default_nsg_rules, {
          "nsgr-ott007-dev-ci1-app-jump-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [443, 9092, 8983, 22]
            source_address_prefixes    = ["10.171.42.197", "10.171.42.198"]
            destination_address_prefix = "10.173.96.0/24"
            priority                   = 500
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          }
          "nsgr-InternetAccess" = {
            source_port_range          = "*"
            destination_port_range     = "*"
            source_address_prefixes    = ["10.173.96.0/24"]
            destination_address_prefix = "Internet"
            priority                   = 600
            access                     = "Allow"
            direction                  = "Outbound"
            protocol                   = "*"
          }
        })
      },
      {
        name                = "nsg-ott007-dev-ci1-data-0008"
        location            = "centralindia"
        resource_group_name = "rg-ott007-dev-ci1-csss-0001"
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
        subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-data-0008"
        security_rule = merge(local.default_nsg_rules, {
          "nsgr-InternetAccess" = {
            source_port_range          = "*"
            destination_port_range     = "*"
            source_address_prefixes    = ["10.173.97.0/25"]
            destination_address_prefix = "Internet"
            priority                   = 600
            access                     = "Allow"
            direction                  = "Outbound"
            protocol                   = "*"
          }
        })
      },
      {
        name                = "nsg-ott007-dev-ci1-data-mysql-0009"
        location            = "centralindia"
        resource_group_name = "rg-ott007-dev-ci1-csss-0001"
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
        subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-data-mysql-0009"
        security_rule = merge(local.default_nsg_rules, {
          "nsgr-ott007-dev-ci1-mysql-jump-0001" = {
            source_port_range          = "*"
            destination_port_range     = "3306"
            source_address_prefixes    = ["10.171.42.197", "10.171.42.198"]
            destination_address_prefix = "10.173.97.128/28"
            priority                   = 500
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          }
        })
      },
      {
        name                = "nsg-ott007-dev-ci1-data-psql-0010"
        location            = "centralindia"
        resource_group_name = "rg-ott007-dev-ci1-csss-0001"
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
        subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-data-psql-0010"
        security_rule = merge(local.default_nsg_rules, {
          "nsgr-ott007-dev-ci1-psql-jump-0001" = {
            source_port_range          = "*"
            destination_port_range     = "5432"
            source_address_prefixes    = ["10.171.42.197", "10.171.42.198"]
            destination_address_prefix = "10.173.97.144/28"
            priority                   = 500
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          }
        })
      },
      {
        name                = "nsg-ott007-dev-ci1-data-mgsql-0011"
        location            = "centralindia"
        resource_group_name = "rg-ott007-dev-ci1-csss-0001"
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
        subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-data-mgsql-0011"
      },
      {
        name                = "nsg-ott007-dev-ci1-medthek-app-0001"
        location            = "centralindia"
        resource_group_name = "rg-ott007-dev-ci1-medthek-0001"
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
        subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-ott007-dev-ci1-medthek-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-medthek-0001/subnets/snet-ott007-dev-ci1-medthekapp-0001"
        security_rule = merge(local.default_nsg_rules, {
          "nsgr-ott007-dev-ci1-medthek-httpsallow-0001" = {
            source_port_range      = "*"
            destination_port_range = "8080"
            source_address_prefixes = [
              "125.19.69.148",
              "115.114.73.219",
              "65.2.185.95",
              "13.234.138.29",
              "23.237.71.197",
              "23.237.71.243",
              "195.138.73.186",
              "195.138.81.17",
              "45.84.167.2"
            ]
            destination_address_prefix = "10.171.9.0/26"
            priority                   = 500
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          }
          # "nsgr-ott007-dev-ci1-medthek-mariaDB-0001" = {
          #   source_port_range      = "*"
          #   destination_port_range = "53306"
          #   source_address_prefixes = [
          #     "125.19.69.148",
          #     "115.114.73.219",
          #     "65.2.185.95",
          #     "13.234.138.29",
          #     "23.237.71.197",
          #     "23.237.71.243",
          #     "195.138.73.186",
          #     "195.138.81.17",
          #     "45.84.167.2"
          #   ]
          #   destination_address_prefix = "10.171.9.0/26"
          #   priority                   = 501
          #   access                     = "Allow"
          #   direction                  = "Inbound"
          #   protocol                   = "*"
          # }
          "nsgr-ott007-dev-ci1-medthek-sslhttps-0001" = {
            source_port_range       = "*"
            destination_port_ranges = ["443", "80"]
            source_address_prefixes = [
              "125.19.69.148",
              "115.114.73.219",
              "65.2.185.95",
              "13.234.138.29",
              "23.237.71.197",
              "23.237.71.243",
              "195.138.73.186",
              "195.138.81.17",
              "45.84.167.2"
            ]
            destination_address_prefix = "10.171.35.0/26"
            priority                   = 503
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          }
          "nsgr-ott007-dev-ci1-medthek-ssh-0001" = {
            priority                     = 1006
            direction                    = "Inbound"
            access                       = "Allow"
            protocol                     = "Tcp"
            source_port_range            = "*"
            destination_port_ranges      = [22]
            source_address_prefixes      = ["10.171.42.192/26"]
            destination_address_prefixes = ["10.171.9.0/26"]
          }
        })
      },
      # {
      #   name                = "nsg-ott007-dev-ci1-data-psql-0012"
      #   location            = "centralindia"
      #   resource_group_name = "rg-ott007-dev-ci1-csss-0001"
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
      #   subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-data-psql-0012"
      #   security_rule = merge(local.default_nsg_rules, {
      #     "nsgr-ott007-dev-ci1-psql-jump-0001" = {
      #       source_port_range          = "*"
      #       destination_port_range     = "5432"
      #       source_address_prefixes    = ["10.171.42.197", "10.171.42.198"]
      #       destination_address_prefix = "10.173.97.144/28"
      #       priority                   = 500
      #       access                     = "Allow"
      #       direction                  = "Inbound"
      #       protocol                   = "*"
      #     }
      #   })
      # }
    ]
  }
}
