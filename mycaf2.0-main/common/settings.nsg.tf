locals {
  default_nsg_rules = {
    # AllowAzureLoadBalancer = {
    #   source_port_range          = "*"
    #   destination_port_range     = "*"
    #   source_address_prefix      = "AzureLoadBalancer"
    #   destination_address_prefix = "*"
    #   priority                   = 4095
    #   access                     = "Allow"
    #   direction                  = "Inbound"
    #   protocol                   = "*"
    # },
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
    #   destination_port_ranges    = [443, 1433, 6380, 9180, 27017, 445, 22, 5432, 3306, 9092, 8983]
    #   source_address_prefix      = "10.173.0.0/17"
    #   destination_address_prefix = "10.173.0.0/17"
    #   priority                   = 200
    #   access                     = "Allow"
    #   direction                  = "Outbound"
    #   protocol                   = "*"
    # },
    # AllowVnetInBound = {
    #   source_port_range          = "*"
    #   destination_port_range     = "*"
    #   source_address_prefix      = "VirtualNetwork"
    #   destination_address_prefix = "VirtualNetwork"
    #   priority                   = 400
    #   access                     = "Allow"
    #   direction                  = "Inbound"
    #   protocol                   = "*"
    # },
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
    settings = {
      "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-apim-0001" = {
        name                = "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-apim-0001"
        location            = local.common.location
        resource_group_name = local.common.resource_group_name_csvc
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
        subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-apim-0001"
        security_rule = merge(local.default_nsg_rules, {
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-jump-apim-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [80, 443, 3443]
            source_address_prefix      = "10.171.42.192/26"
            destination_address_prefix = "10.173.98.0/26"
            priority                   = 500
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-hubvnet-apim-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [80, 443, 3443]
            source_address_prefixes    = ["10.171.32.0/22", "10.171.44.0/23"]
            destination_address_prefix = "10.173.98.0/26"
            priority                   = 501
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-atemevnet-apim-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [80, 443, 3443]
            source_address_prefix      = "10.172.112.0/20"
            destination_address_prefix = "10.173.98.0/26"
            priority                   = 502
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-datavnet-apim-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [80, 443, 3443]
            source_address_prefixes    = ["10.171.11.0/26", "10.171.12.0/24", "10.171.40.0/26"]
            destination_address_prefix = "10.173.98.0/26"
            priority                   = 503
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-apim-internet-0002" = {
            source_port_range          = "*"
            destination_port_ranges    = [80, 443]
            source_address_prefix      = "Internet"
            destination_address_prefix = "VirtualNetwork"
            priority                   = 504
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "Tcp"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-apim-builtin-0003" = {
            source_port_range          = "*"
            destination_port_range     = 3443
            source_address_prefix      = "ApiManagement"
            destination_address_prefix = "10.173.98.0/26"
            priority                   = 505
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "Tcp"
          },
          "AllowAzureLoadBalancer" = {
            source_port_range          = "*"
            destination_port_range     = "*"
            source_address_prefix      = "AzureLoadBalancer"
            destination_address_prefix = "10.173.98.0/26"
            priority                   = 4095
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-apim-builtin-0004" = {
            source_port_range          = "*"
            destination_port_range     = 443
            source_address_prefix      = "VirtualNetwork"
            destination_address_prefix = "Storage"
            priority                   = 500
            access                     = "Allow"
            direction                  = "Outbound"
            protocol                   = "Tcp"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-apim-builtin-0005" = {
            source_port_range          = "*"
            destination_port_range     = 1433
            source_address_prefix      = "VirtualNetwork"
            destination_address_prefix = "Sql"
            priority                   = 501
            access                     = "Allow"
            direction                  = "Outbound"
            protocol                   = "Tcp"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-apim-builtin-0006" = {
            source_port_range          = "*"
            destination_port_range     = 443
            source_address_prefix      = "VirtualNetwork"
            destination_address_prefix = "AzureKeyVault"
            priority                   = 502
            access                     = "Allow"
            direction                  = "Outbound"
            protocol                   = "Tcp"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-apim-builtin-0007" = {
            source_port_range          = "*"
            destination_port_ranges    = [1886, 443]
            source_address_prefix      = "VirtualNetwork"
            destination_address_prefix = "AzureMonitor"
            priority                   = 503
            access                     = "Allow"
            direction                  = "Outbound"
            protocol                   = "Tcp"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-apim-builtin-0008" = {
            source_port_range          = "*"
            destination_port_range     = 443
            source_address_prefix      = "VirtualNetwork"
            destination_address_prefix = "AzureActiveDirectory"
            priority                   = 504
            access                     = "Allow"
            direction                  = "Outbound"
            protocol                   = "Tcp"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-apim-builtin-0009" = {
            source_port_range          = "*"
            destination_port_range     = 443
            source_address_prefix      = "VirtualNetwork"
            destination_address_prefix = "AzureConnectors"
            priority                   = 505
            access                     = "Allow"
            direction                  = "Outbound"
            protocol                   = "Tcp"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-apim-builtin-0010" = {
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

      }
      "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-aks-0002" = {

        name                = "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-aks-0002"
        location            = local.common.location
        resource_group_name = local.common.resource_group_name_csvc
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
        subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-aks-0002"
        security_rule = merge(local.default_nsg_rules, {
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-apim-aks-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [80, 443, 3443]
            source_address_prefix      = "10.173.98.0/26"
            destination_address_prefix = "10.173.64.0/19"
            priority                   = 500
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "Tcp"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-jump-aks-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [80, 443, 22]
            source_address_prefix      = "10.171.42.192/26"
            destination_address_prefix = "10.173.64.0/19"
            priority                   = 501
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-hubvnet-aks-0001" = {
            source_port_range          = "*"
            destination_port_range     = "443"
            source_address_prefixes    = ["10.171.32.0/22", "10.171.44.0/23"]
            destination_address_prefix = "10.173.64.0/19"
            priority                   = 502
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-atemevnet-aks-0001" = {
            source_port_range          = "*"
            destination_port_range     = "443"
            source_address_prefix      = "10.172.112.0/20"
            destination_address_prefix = "10.173.64.0/19"
            priority                   = 503
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-datavnet-aks-0001" = {
            source_port_range          = "*"
            destination_port_range     = "443"
            source_address_prefixes    = ["10.171.11.0/26", "10.171.12.0/24", "10.171.40.0/26"]
            destination_address_prefix = "10.173.64.0/19"
            priority                   = 504
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "AllowAzureLoadBalancer" = {
            source_port_range          = "*"
            destination_port_range     = "*"
            source_address_prefix      = "AzureLoadBalancer"
            destination_address_prefix = "10.173.64.0/19"
            priority                   = 4095
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          }
        })

      }
      "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-aks-0003" = {

        name                = "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-aks-0003"
        location            = local.common.location
        resource_group_name = local.common.resource_group_name_csvc
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
        subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-aks-0003"
        security_rule = merge(local.default_nsg_rules, {
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-apim-aks-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [80, 443, 3443]
            source_address_prefix      = "10.173.98.0/26"
            destination_address_prefix = "10.173.0.0/18"
            priority                   = 500
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "Tcp"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-jump-aks-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [80, 443, 22]
            source_address_prefix      = "10.173.98.0/26"
            destination_address_prefix = "10.173.0.0/18"
            priority                   = 501
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-hubvnet-aks-0001" = {
            source_port_range          = "*"
            destination_port_range     = "443"
            source_address_prefixes    = ["10.171.32.0/22", "10.171.44.0/23"]
            destination_address_prefix = "10.173.0.0/18"
            priority                   = 502
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-atemevnet-aks-0001" = {
            source_port_range          = "*"
            destination_port_range     = "443"
            source_address_prefix      = "10.172.112.0/20"
            destination_address_prefix = "10.173.0.0/18"
            priority                   = 503
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-datavnet-aks-0001" = {
            source_port_range          = "*"
            destination_port_range     = "443"
            source_address_prefixes    = ["10.171.11.0/26", "10.171.12.0/24", "10.171.40.0/26"]
            destination_address_prefix = "10.173.0.0/18"
            priority                   = 504
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "AllowAzureLoadBalancer" = {
            source_port_range          = "*"
            destination_port_range     = "*"
            source_address_prefix      = "AzureLoadBalancer"
            destination_address_prefix = "10.173.0.0/18"
            priority                   = 4095
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          }
        })

      }

      "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-fappint-0004" = {

        name                = "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-fappint-0004"
        location            = local.common.location
        resource_group_name = local.common.resource_group_name_csvc
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
        subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-fappint-0004"
        security_rule = merge(local.default_nsg_rules, {
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-jump-fappint-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [80, 443]
            source_address_prefix      = "10.171.42.192/26"
            destination_address_prefix = "10.173.98.64/26"
            priority                   = 500
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-hubvnet-fappint-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [80, 443]
            source_address_prefixes    = ["10.171.32.0/22", "10.171.44.0/23"]
            destination_address_prefix = "10.173.98.64/26"
            priority                   = 501
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-atemevnet-fappint-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [80, 443]
            source_address_prefix      = "10.172.112.0/20"
            destination_address_prefix = "10.173.98.64/26"
            priority                   = 502
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-datavnet-fappint-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [80, 443]
            source_address_prefixes    = ["10.171.11.0/26", "10.171.12.0/24", "10.171.40.0/26"]
            destination_address_prefix = "10.173.98.64/26"
            priority                   = 503
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "AllowAzureLoadBalancer" = {
            source_port_range          = "*"
            destination_port_range     = "*"
            source_address_prefix      = "AzureLoadBalancer"
            destination_address_prefix = "10.173.98.64/26"
            priority                   = 4095
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          }
        })

      }
      "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-fappint-0005" = {

        name                = "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-fappint-0005"
        location            = local.common.location
        resource_group_name = local.common.resource_group_name_csvc
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
        subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-fappint-0005"
        security_rule = merge(local.default_nsg_rules, {
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-jump-fappint-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [80, 443]
            source_address_prefix      = "10.171.42.192/26"
            destination_address_prefix = "10.173.98.128/26"
            priority                   = 500
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-hubvnet-fappint-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [80, 443]
            source_address_prefixes    = ["10.171.32.0/22", "10.171.44.0/23"]
            destination_address_prefix = "10.173.98.128/26"
            priority                   = 501
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-atemevnet-fappint-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [80, 443]
            source_address_prefix      = "10.172.112.0/20"
            destination_address_prefix = "10.173.98.128/26"
            priority                   = 502
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-datavnet-fappint-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [80, 443]
            source_address_prefixes    = ["10.171.11.0/26", "10.171.12.0/24", "10.171.40.0/26"]
            destination_address_prefix = "10.173.98.128/26"
            priority                   = 503
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "AllowAzureLoadBalancer" = {
            source_port_range          = "*"
            destination_port_range     = "*"
            source_address_prefix      = "AzureLoadBalancer"
            destination_address_prefix = "10.173.98.128/26"
            priority                   = 4095
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          }
        })

      }
      "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-fappint-0006" = {

        name                = "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-fappint-0006"
        location            = local.common.location
        resource_group_name = local.common.resource_group_name_csvc
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
        subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-fappint-0006"
        security_rule = merge(local.default_nsg_rules, {
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-jump-fappint-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [80, 443]
            source_address_prefix      = "10.171.42.192/26"
            destination_address_prefix = "10.173.98.192/26"
            priority                   = 500
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-hubvnet-fappint-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [80, 443]
            source_address_prefixes    = ["10.171.32.0/22", "10.171.44.0/23"]
            destination_address_prefix = "10.173.98.192/26"
            priority                   = 501
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-atemevnet-fappint-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [80, 443]
            source_address_prefix      = "10.172.112.0/20"
            destination_address_prefix = "10.173.98.192/26"
            priority                   = 502
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-datavnet-fappint-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [80, 443]
            source_address_prefixes    = ["10.171.11.0/26", "10.171.12.0/24", "10.171.40.0/26"]
            destination_address_prefix = "10.173.98.192/26"
            priority                   = 503
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "AllowAzureLoadBalancer" = {
            source_port_range          = "*"
            destination_port_range     = "*"
            source_address_prefix      = "AzureLoadBalancer"
            destination_address_prefix = "10.173.98.192/26"
            priority                   = 4095
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          }
        })
      }
      "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-fappint-0012" = {

        name                = "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-fappint-0012"
        location            = local.common.location
        resource_group_name = local.common.resource_group_name_csvc
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
        subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-fappint-0012"
        security_rule = merge(local.default_nsg_rules, {
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-jump-fappint-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [80, 443]
            source_address_prefix      = "10.171.42.192/26"
            destination_address_prefix = "10.173.97.192/27"
            priority                   = 500
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-hubvnet-fappint-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [80, 443]
            source_address_prefixes    = ["10.171.32.0/22", "10.171.44.0/23"]
            destination_address_prefix = "10.173.97.192/27"
            priority                   = 501
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-atemevnet-fappint-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [80, 443]
            source_address_prefix      = "10.172.112.0/20"
            destination_address_prefix = "10.173.97.192/27"
            priority                   = 502
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-datavnet-fappint-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [80, 443]
            source_address_prefixes    = ["10.171.11.0/26", "10.171.12.0/24", "10.171.40.0/26"]
            destination_address_prefix = "10.173.97.192/27"
            priority                   = 503
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "AllowAzureLoadBalancer" = {
            source_port_range          = "*"
            destination_port_range     = "*"
            source_address_prefix      = "AzureLoadBalancer"
            destination_address_prefix = "10.173.97.192/27"
            priority                   = 4095
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          }
        })

      }
      "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007" = {

        name                = "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
        location            = local.common.location
        resource_group_name = local.common.resource_group_name_csvc
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
        subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
        security_rule = merge(local.default_nsg_rules, {
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-jump-app-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [9092, 22, 8983, 443]
            source_address_prefix      = "10.171.42.192/26"
            destination_address_prefix = "10.173.96.0/24"
            priority                   = 500
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-hubvnet-app-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [9092, 8983, 443]
            source_address_prefixes    = ["10.171.32.0/22", "10.171.44.0/23"]
            destination_address_prefix = "10.173.96.0/24"
            priority                   = 501
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-atemevnet-app-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [9092, 8983, 443]
            source_address_prefix      = "10.172.112.0/20"
            destination_address_prefix = "10.173.96.0/24"
            priority                   = 502
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-datavnet-app-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [9092, 8983, 443]
            source_address_prefixes    = ["10.171.11.0/26", "10.171.12.0/24", "10.171.40.0/26"]
            destination_address_prefix = "10.173.96.0/24"
            priority                   = 503
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "AllowAzureLoadBalancer" = {
            source_port_range          = "*"
            destination_port_range     = "*"
            source_address_prefix      = "AzureLoadBalancer"
            destination_address_prefix = "10.173.96.0/24"
            priority                   = 4095
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
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
      }
      "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008" = {

        name                = "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"
        location            = local.common.location
        resource_group_name = local.common.resource_group_name_csvc
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
        subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"
        security_rule = merge(local.default_nsg_rules, {
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-app-data-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [9092, 9093, 8983, 9180, 443, 6380, 27017, 445, 5432, 3306, 10255, 10350]
            source_address_prefix      = "10.173.96.0/24"
            destination_address_prefix = "10.173.97.0/25"
            priority                   = 500
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-jump-data-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [9092, 9093, 8983, 9180, 443, 6380, 27017, 445, 5432, 3306, 10255, 10350]
            source_address_prefix      = "10.171.42.192/26"
            destination_address_prefix = "10.173.97.0/25"
            priority                   = 501
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-hubvnet-data-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [9092, 9093, 8983, 9180, 443, 6380, 27017, 445, 5432, 3306, 10255, 10350]
            source_address_prefixes    = ["10.171.32.0/22", "10.171.44.0/23"]
            destination_address_prefix = "10.173.97.0/25"
            priority                   = 502
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-atemevnet-data-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [9092, 9093, 8983, 9180, 443, 6380, 27017, 445, 5432, 3306, 10255, 10350]
            source_address_prefix      = "10.172.112.0/20"
            destination_address_prefix = "10.173.97.0/25"
            priority                   = 503
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-datavnet-data-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [9092, 9093, 8983, 9180, 443, 6380, 27017, 445, 5432, 3306, 10255, 10350]
            source_address_prefixes    = ["10.171.11.0/26", "10.171.12.0/24", "10.171.40.0/26"]
            destination_address_prefix = "10.173.97.0/25"
            priority                   = 504
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "AllowAzureLoadBalancer" = {
            source_port_range          = "*"
            destination_port_range     = "*"
            source_address_prefix      = "AzureLoadBalancer"
            destination_address_prefix = "10.173.97.0/25"
            priority                   = 4095
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
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

      }
      "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-data-mysql-0009" = {

        name                = "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-data-mysql-0009"
        location            = local.common.location
        resource_group_name = local.common.resource_group_name_csvc
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
        subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-mysql-0009"
        security_rule = merge(local.default_nsg_rules, {
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-app-mysql-0001" = {
            source_port_range          = "*"
            destination_port_range     = "3306"
            source_address_prefix      = "10.173.96.0/24"
            destination_address_prefix = "10.173.97.128/28"
            priority                   = 500
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "Tcp"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-jump-mysql-0001" = {
            source_port_range          = "*"
            destination_port_range     = "3306"
            source_address_prefix      = "10.171.42.192/26"
            destination_address_prefix = "10.173.97.128/28"
            priority                   = 501
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-hubvnet-mysql-0001" = {
            source_port_range          = "*"
            destination_port_range     = "3306"
            source_address_prefixes    = ["10.171.32.0/22", "10.171.44.0/23"]
            destination_address_prefix = "10.173.97.128/28"
            priority                   = 502
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-atemevnet-mysql-0001" = {
            source_port_range          = "*"
            destination_port_range     = "3306"
            source_address_prefix      = "10.172.112.0/20"
            destination_address_prefix = "10.173.97.128/28"
            priority                   = 503
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-datavnet-mysql-0001" = {
            source_port_range          = "*"
            destination_port_range     = "3306"
            source_address_prefixes    = ["10.171.11.0/26", "10.171.12.0/24", "10.171.40.0/26"]
            destination_address_prefix = "10.173.97.128/28"
            priority                   = 504
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "AllowAzureLoadBalancer" = {
            source_port_range          = "*"
            destination_port_range     = "*"
            source_address_prefix      = "AzureLoadBalancer"
            destination_address_prefix = "10.173.97.128/28"
            priority                   = 4095
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          }
        })

      }
      "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-data-mgsql-0011" = {

        name                = "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-data-mgsql-0011"
        location            = local.common.location
        resource_group_name = local.common.resource_group_name_csvc
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
        subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-mgsql-0011"
        security_rule = merge({
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-mgsql-builtin-0005" = {
            source_port_range          = "*"
            destination_port_range     = "*"
            source_address_prefix      = "10.173.97.160/27"
            destination_address_prefix = "*"
            priority                   = 103
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-mgsql-builtin-0010" = {
            source_port_range          = "*"
            destination_port_range     = "*"
            source_address_prefix      = "10.173.97.160/27"
            destination_address_prefix = "*"
            priority                   = 101
            access                     = "Allow"
            direction                  = "Outbound"
            protocol                   = "*"
          },
          "AllowInboundApplicationAccess" = {
            source_port_range = "*"
            destination_port_ranges = [
              1433,
              22,
              27017,
              3306,
              443,
              445,
              5432,
              6380,
              8983,
              9092,
              9180,
            ]
            source_address_prefix      = "10.173.0.0/17"
            destination_address_prefix = "10.173.0.0/17"
            priority                   = 200
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "AllowOutboundApplicationAccess" = {
            source_port_range = "*"
            destination_port_ranges = [
              1433,
              22,
              27017,
              3306,
              443,
              445,
              5432,
              6380,
              8983,
              9092,
              9180,
            ]
            source_address_prefix      = "10.173.0.0/17"
            destination_address_prefix = "10.173.0.0/17"
            priority                   = 200
            access                     = "Allow"
            direction                  = "Outbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-mgsql-builtin-0003" = {
            source_port_range          = "*"
            destination_port_ranges    = [9000, 9003]
            source_address_prefix      = "CorpNetPublic"
            destination_address_prefix = "10.173.97.160/27"
            priority                   = 101
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "Tcp"
          },

          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-mgsql-builtin-0004" = {
            source_port_range          = "*"
            destination_port_ranges    = [9000, 1438, 1440, 9003, 1452]
            source_address_prefix      = "SqlManagement"
            destination_address_prefix = "10.173.97.160/27"
            priority                   = 102
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-mgsql-builtin-0002" = {
            source_port_range          = "*"
            destination_port_ranges    = [9000, 1440, 9003]
            source_address_prefix      = "CorpNetSaw"
            destination_address_prefix = "10.173.97.160/27"
            priority                   = 106
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "Tcp"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-data-mgsql-0001" = {
            source_port_range          = "*"
            destination_port_range     = "1433"
            source_address_prefix      = "10.173.97.0/25"
            destination_address_prefix = "10.173.97.160/27"
            priority                   = 503
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-app-mgsql-0001" = {
            source_port_range          = "*"
            destination_port_range     = "1433"
            source_address_prefix      = "10.173.96.0/24"
            destination_address_prefix = "10.173.97.160/27"
            priority                   = 504
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-jump-mgsql-0001" = {
            source_port_range          = "*"
            destination_port_range     = "1433"
            source_address_prefix      = "10.171.42.192/26"
            destination_address_prefix = "10.173.97.160/27"
            priority                   = 505
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-hubvnet-mgsql-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [9000, 1438, 1440, 9003, 1452]
            source_address_prefixes    = ["10.171.32.0/22", "10.171.44.0/23"]
            destination_address_prefix = "10.173.97.160/27"
            priority                   = 506
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-atemevnet-mgsql-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [9000, 1438, 1440, 9003, 1452]
            source_address_prefix      = "10.172.112.0/20"
            destination_address_prefix = "10.173.97.160/27"
            priority                   = 507
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-datavnet-mgsql-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [9000, 1438, 1440, 9003, 1452]
            source_address_prefixes    = ["10.171.11.0/26", "10.171.12.0/24", "10.171.40.0/26"]
            destination_address_prefix = "10.173.97.160/27"
            priority                   = 508
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "AllowAzureLoadBalancer" = {
            source_port_range          = "*"
            destination_port_range     = "*"
            source_address_prefix      = "AzureLoadBalancer"
            destination_address_prefix = "10.173.97.160/27"
            priority                   = 4095
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          # "DenyAllInBound" = {
          #   source_port_range          = "*"
          #   destination_port_range     = "*"
          #   source_address_prefix      = "*"
          #   destination_address_prefix = "*"
          #   priority                   = 4096
          #   access                     = "Deny"
          #   direction                  = "Inbound"
          #   protocol                   = "*"
          # },
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
        })

      }
      "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-data-psql-0010" = {

        name                = "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-data-psql-0010"
        location            = local.common.location
        resource_group_name = local.common.resource_group_name_csvc
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
        subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-psql-0010"
        security_rule = merge(local.default_nsg_rules, {
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-data-psql-0001" = {
            source_port_range          = "*"
            destination_port_range     = "5432"
            source_address_prefix      = "10.173.97.0/25"
            destination_address_prefix = "10.173.97.144/28"
            priority                   = 500
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-app-psql-0001" = {
            source_port_range          = "*"
            destination_port_range     = "5432"
            source_address_prefix      = "10.173.96.0/24"
            destination_address_prefix = "10.173.97.144/28"
            priority                   = 501
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-jump-psql-0001" = {
            source_port_range          = "*"
            destination_port_range     = "5432"
            source_address_prefix      = "10.171.42.192/26"
            destination_address_prefix = "10.173.97.144/28"
            priority                   = 502
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-hubvnet-psql-0001" = {
            source_port_range          = "*"
            destination_port_range     = "5432"
            source_address_prefixes    = ["10.171.32.0/22", "10.171.44.0/23"]
            destination_address_prefix = "10.173.97.144/28"
            priority                   = 503
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-atemevnet-psql-0001" = {
            source_port_range          = "*"
            destination_port_range     = "5432"
            source_address_prefix      = "10.172.112.0/20"
            destination_address_prefix = "10.173.97.144/28"
            priority                   = 504
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-datavnet-psql-0001" = {
            source_port_range          = "*"
            destination_port_range     = "5432"
            source_address_prefixes    = ["10.171.11.0/26", "10.171.12.0/24", "10.171.40.0/26"]
            destination_address_prefix = "10.173.97.144/28"
            priority                   = 505
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "AllowAzureLoadBalancer" = {
            source_port_range          = "*"
            destination_port_range     = "*"
            source_address_prefix      = "AzureLoadBalancer"
            destination_address_prefix = "10.173.97.144/28"
            priority                   = 4095
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          }
        })

      }
      "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-medthek-app-0001" = {

        name                = "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-medthek-app-0001"
        location            = local.common.location
        resource_group_name = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-medthek-0001"
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
        subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-${local.common.bu_name}-${local.common.dep_env}-ci1-medthek-0001/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-medthek-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-medthekapp-0001"
        security_rule = merge(local.default_nsg_rules, {
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-medthek-httpsallow-0001" = {
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
          # "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-medthek-mariaDB-0001" = {
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
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-medthek-sslhttps-0001" = {
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
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-medthek-ssh-0001" = {
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

      }
      "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-aks-0004" = {

        name                = "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-aks-0004"
        location            = local.common.location
        resource_group_name = local.common.resource_group_name_csvc
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
        subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-0001"
        security_rule = merge(local.default_nsg_rules, {
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-apim-aks-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [80, 443, 3443]
            source_address_prefix      = "10.173.98.0/26"
            destination_address_prefix = "10.173.100.0/22"
            priority                   = 500
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "Tcp"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-jump-aks-0001" = {
            source_port_range          = "*"
            destination_port_ranges    = [80, 443, 22]
            source_address_prefix      = "10.171.42.192/26"
            destination_address_prefix = "10.173.100.0/22"
            priority                   = 501
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-hubvnet-aks-0001" = {
            source_port_range          = "*"
            destination_port_range     = "443"
            source_address_prefixes    = ["10.171.32.0/22", "10.171.44.0/23"]
            destination_address_prefix = "10.173.100.0/22"
            priority                   = 502
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "nsgr-${local.common.bu_name}-${local.common.dep_env}-ci1-datavnet-aks-0001" = {
            source_port_range          = "*"
            destination_port_range     = "443"
            source_address_prefixes    = ["10.171.11.0/26", "10.171.12.0/24", "10.171.40.0/26"]
            destination_address_prefix = "10.173.100.0/22"
            priority                   = 504
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          },
          "AllowAzureLoadBalancer" = {
            source_port_range          = "*"
            destination_port_range     = "*"
            source_address_prefix      = "AzureLoadBalancer"
            destination_address_prefix = "10.173.100.0/22"
            priority                   = 4095
            access                     = "Allow"
            direction                  = "Inbound"
            protocol                   = "*"
          }
        })

      }
      "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-atemeaks-0001" = {

        name                = "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-atemeaks-0001"
        location            = local.common.location
        resource_group_name = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001"
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
        subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_ateme}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-atemeaks-0001"

      }

    }
  }
}
