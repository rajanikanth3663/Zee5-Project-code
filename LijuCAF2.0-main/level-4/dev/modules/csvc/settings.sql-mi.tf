locals {
  configure_sql_mi_resources = {
    settings = {
      name                         = "sqlmi-ott007-dev-ci1-csss-0001"
      location                     = "centralindia"
      resource_group_name          = "rg-ott007-dev-ci1-csss-0001"
      administrator_login          = "csssdevadmin"
      administrator_login_password = "C5vc@dmin"
      sku_name                     = "GP_Gen5"
      subnet_id                    = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-data-mgsql-0011"
      subnet_CIDR                  = "10.173.97.160/27"
      vcores                       = 4
      storage_size_in_gb           = 32
      public_data_endpoint_enabled = false
      minimum_tls_version          = 1.2
      timezone_id                  = "UTC"

      network_security_group_name  = "nsg-ott007-dev-ci1-data-mgsql-0011"
      azurerm_sql_managed_database = []
      route_table_name             = "rt-ott007-dev-ci1-cssssqlmi-0001"
      security_rule = {
        "nsgr-ott007-dev-ci1-mgsql-jump-0001" = {
          priority                   = 500
          direction                  = "Inbound"
          access                     = "Allow"
          protocol                   = "*"
          source_port_range          = "*"
          destination_port_ranges    = ["1433"]
          source_address_prefixes    = ["10.171.42.197", "10.171.42.198"]
          destination_address_prefix = "10.173.97.160/27"
        },
        "nsgr-ott007-dev-ci1-mgsql-builtin-0002" = {
          priority                   = 106
          direction                  = "Inbound"
          access                     = "Allow"
          protocol                   = "Tcp"
          source_port_range          = "*"
          destination_port_ranges    = ["9000", "9003", "1440"]
          source_address_prefix      = "CorpNetSaw"
          destination_address_prefix = "10.173.97.160/27"
        },
        "nsgr-ott007-dev-ci1-mgsql-builtin-0003" = {
          priority                   = 101
          direction                  = "Inbound"
          access                     = "Allow"
          protocol                   = "Tcp"
          source_port_range          = "*"
          destination_port_ranges    = ["9000", "9003"]
          source_address_prefix      = "CorpNetPublic"
          destination_address_prefix = "10.173.97.160/27"
        },
        "nsgr-ott007-dev-ci1-mgsql-builtin-0004" = {
          priority                   = 102
          direction                  = "Inbound"
          access                     = "Allow"
          protocol                   = "Tcp"
          source_port_range          = "*"
          destination_port_ranges    = ["9000", "9003", "1438", "1440", "1452"]
          source_address_prefix      = "SqlManagement"
          destination_address_prefix = "10.173.97.160/27"
        },
        "nsgr-ott007-dev-ci1-mgsql-builtin-0005" = {
          priority                   = 103
          direction                  = "Inbound"
          access                     = "Allow"
          protocol                   = "*"
          source_port_range          = "*"
          destination_port_range     = "*"
          source_address_prefix      = "10.173.97.160/27"
          destination_address_prefix = "*"
        },
        "nsgr-ott007-dev-ci1-mgsql-builtin-0006" = {
          priority                   = 104
          direction                  = "Inbound"
          access                     = "Allow"
          protocol                   = "*"
          source_port_range          = "*"
          destination_port_range     = "*"
          source_address_prefix      = "AzureLoadBalancer"
          destination_address_prefix = "10.173.97.160/27"
        },
        "nsgr-ott007-dev-ci1-mgsql-builtin-0007" = {
          priority                   = 105
          direction                  = "Inbound"
          access                     = "Allow"
          protocol                   = "*"
          source_port_range          = "*"
          destination_port_range     = "*"
          source_address_prefix      = "10.173.97.160/27"
          destination_address_prefix = "10.173.97.160/27"
        },
        "nsgr-ott007-dev-ci1-mgsql-denyallinbound-0008" = {
          priority                   = 4096
          direction                  = "Inbound"
          access                     = "Deny"
          protocol                   = "*"
          source_port_range          = "*"
          destination_port_range     = "*"
          source_address_prefix      = "*"
          destination_address_prefix = "*"
        },
        "nsgr-ott007-dev-ci1-mgsql-builtin-0009" = {
          priority                   = 100
          direction                  = "Outbound"
          access                     = "Allow"
          protocol                   = "Tcp"
          source_port_range          = "*"
          destination_port_ranges    = ["80", "443", "12000"]
          source_address_prefix      = "*"
          destination_address_prefix = "AzureCloud"
        },
        "nsgr-ott007-dev-ci1-mgsql-builtin-0010" = {
          priority                   = 101
          direction                  = "Outbound"
          access                     = "Allow"
          protocol                   = "*"
          source_port_range          = "*"
          destination_port_range     = "*"
          source_address_prefix      = "10.173.97.160/27"
          destination_address_prefix = "*"
        },
        "nsgr-ott007-dev-ci1-mgsql-denyalloutbound-0011" = {
          priority                   = 4096
          direction                  = "Outbound"
          access                     = "Deny"
          protocol                   = "*"
          source_port_range          = "*"
          destination_port_range     = "*"
          source_address_prefix      = "*"
          destination_address_prefix = "*"
        },
        AllowInboundApplicationAccess = {
          source_port_range          = "*"
          destination_port_ranges    = [443, 1433, 6380, 9180, 27017, 445, 22, 5432, 1433, 3306, 9092, 8983]
          source_address_prefix      = "10.173.0.0/17"
          destination_address_prefix = "10.173.0.0/17"
          priority                   = 200
          access                     = "Allow"
          direction                  = "Inbound"
          protocol                   = "*"
        },
        AllowOutboundApplicationAccess = {
          source_port_range          = "*"
          destination_port_ranges    = [443, 1433, 6380, 9180, 27017, 445, 22, 5432, 1433, 3306, 9092, 8983]
          source_address_prefix      = "10.173.0.0/17"
          destination_address_prefix = "10.173.0.0/17"
          priority                   = 200
          access                     = "Allow"
          direction                  = "Outbound"
          protocol                   = "*"
        }
      }
    }
  }
}
