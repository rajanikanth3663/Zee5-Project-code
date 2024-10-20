
locals {
  configure_udr_resources = {
    settings = {
      rt-ott007-dev-ci1-csss-internetroute-0001 = {
        name                = "rt-ott007-dev-ci1-csss-internetroute-0001"
        location            = "centralindia"
        resource_group_name = "rg-ott007-dev-ci1-csss-0001"
        route = [
          {
            name                   = "udr-ott007-dev-ci1-internetroute-0001"
            address_prefix         = "0.0.0.0/0"
            next_hop_type          = "VirtualAppliance"
            next_hop_in_ip_address = "10.171.34.4"
          }
        ]
        subnets = [
          # { subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-apim-0001" },
          { subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-fappint-0004" },
          { subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-fappint-0005" },
          { subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-fappint-0006" },
          # { subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-app-0007" },
          # { subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-data-0008" },
          { subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-data-mysql-0009" },
          { subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-data-psql-0010" },
          { subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-aks-0002" },
          { subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-aks-0003" }
        ]
      }

      # rt-ott007-dev-ci1-csss-apimroute-0001 = {
      #   name                = "rt-ott007-dev-ci1-csss-apimroute-0001"
      #   location            = "centralindia"
      #   resource_group_name = "rg-ott007-dev-ci1-csss-0001"
      #   route = [
      #     {
      #       name           = "apimroute"
      #       address_prefix = "ApiManagement"
      #       next_hop_type  = "Internet"
      #     },
      #     {
      #       name                   = "internetroute"
      #       address_prefix         = "0.0.0.0/0"
      #       next_hop_type          = "VirtualAppliance"
      #       next_hop_in_ip_address = "10.171.34.4"
      #     }
      #   ]
      #   subnets = [
      #     { subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-apim-0001" },
      #   ]
      # }
    }
  }
}
