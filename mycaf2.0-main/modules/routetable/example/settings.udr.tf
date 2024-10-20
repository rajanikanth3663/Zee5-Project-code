
locals {
  configure_udr_resources = {
    settings = {
      name                = "rt-test"
      location            = "central india"
      resource_group_name = "udr-rg"
      route = [
        {
          name                   = "udr-01"
          address_prefix         = "0.0.0.0/0"
          next_hop_type          = "VirtualAppliance"
          next_hop_in_ip_address = "10.10.10.10"
        },
        {
          name                   = "udr-02"
          address_prefix         = "10.0.0.0/24"
          next_hop_type          = "VirtualAppliance"
          next_hop_in_ip_address = "10.10.10.10"
        }
      ]
      subnets = [{ subnet_id = "/subscriptions/sub-id/resourceGroups/udr-rg/providers/Microsoft.Network/virtualNetworks/vnet1/subnets/default" },
        { subnet_id = "/subscriptions/sub-id/resourceGroups/udr-rg/providers/Microsoft.Network/virtualNetworks/vnet1/subnets/test" }
      ]


    }
  }
}
