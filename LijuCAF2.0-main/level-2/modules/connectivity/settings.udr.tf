
locals {
  configure_udr_resources = {
    settings = {
      rt-ott007-hubnp-ci1-devops-internetroute-0001 = {
        name                = "rt-ott007-hubnp-ci1-devops-internetroute-0001"
        location            = "centralindia"
        resource_group_name = "rg-ott007-np-ci1-hubconnectivity-0001"
        route = [
          {
            name                   = "udr-ott007-hubnp-devops-internetroute-0001"
            address_prefix         = "0.0.0.0/0"
            next_hop_type          = "VirtualAppliance"
            next_hop_in_ip_address = "10.171.34.4"
          }
        ]
        subnets = [
          { subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-ott007-np-ci1-hubconnectivity-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-np-ci1-hub-0001/subnets/snet-ott007-np-ci1-devops-0001" },
          { subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-ott007-np-ci1-hubconnectivity-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-np-ci1-hub-0001/subnets/snet-ott007-np-ci1-devops-0002" },
        ]
      }
    }
  }
}
