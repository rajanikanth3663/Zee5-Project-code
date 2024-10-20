locals {
  configure_udr_resources = {
    settings = {
      "rt-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-internetroute-0001" = {
        name                = "rt-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-internetroute-0001"
        location            = local.common.location
        resource_group_name = local.common.resource_group_name_csvc
        route = [
          {
            name                   = "udr-${local.common.bu_name}-${local.common.dep_env}-ci1-internetroute-0001"
            address_prefix         = "0.0.0.0/0"
            next_hop_type          = "VirtualAppliance"
            next_hop_in_ip_address = "10.171.34.10"
          }
        ]
        subnets = [
          # { subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-apim-0001" },
          { subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-fappint-0004" },
          { subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-fappint-0005" },
          { subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-fappint-0006" },
          { subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007" },
          { subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008" },
          { subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-mysql-0009" },
          { subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-psql-0010" },
          { subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-aks-0002" },
          { subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-aks-0003" },
          { subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-fappint-0012" },
          { subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-0001" },
          { subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0003/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-sch-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0001" },
          { subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0003/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-sch-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0001" },
          { subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_ateme}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-atemeaks-0001" },
          { subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0003/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-sch-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-fappint-0001" }
        ]
      }

      # rt-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-apimroute-0001 = {
      #   name                = "rt-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-apimroute-0001"
      #   location            = local.common.location
      #   resource_group_name = local.common.resource_group_name_csvc
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
      #       next_hop_in_ip_address = "10.171.34.10"
      #     }
      #   ]
      #   subnets = [
      #     { subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-apim-0001" },
      #   ]
      # }
    }
  }
}
