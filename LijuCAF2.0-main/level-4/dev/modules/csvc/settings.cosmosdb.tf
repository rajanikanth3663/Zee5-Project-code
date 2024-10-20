locals {
  configure_cosmosdb_resources = {
    settings = {
      location            = "centralindia"
      resource_group_name = "rg-ott007-dev-ci1-csss-0001"
      name                = "cosmos-ott007-dev-ci1-csss-0001"

      geo_location = [
        {
          location          = "centralindia"
          failover_priority = 1
          }, {
          location          = "southindia"
          failover_priority = 0
        }
      ]
      is_virtual_network_filter_enabled = true
      virtual_network_rule = [{
        id = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-app-0001"
        }
      ]
    }
  }
}