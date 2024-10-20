locals {
  configure_eventgrid_resources = {
    settings = {

      egt-ott007-dev-ci1-ve-inv-copy-script-stitching-0001 = {
        resource_group_name           = "rg-ott007-dev-ci1-ve-0001"
        name                          = "egt-ott007-dev-ci1-ve-inv-copy-script-stitching-0001"
        location                      = "centralindia"
        public_network_access_enabled = false

        private_endpoint = {
          endpoint_name        = "pep-ott007-np-ci1-veegt-0001"
          subnet_id            = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-app-0007"
          connection_name      = "pep-ott007-np-ci1-veegt-0001"
          private_dns_zone_ids = ["/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.eventgrid.azure.net"]
        }
      }
      egt-ott007-dev-ci1-ve-inv-transcdashmanifestmod-0002 = {
        resource_group_name           = "rg-ott007-dev-ci1-ve-0001"
        name                          = "egt-ott007-dev-ci1-ve-inv-transcdashmanifestmod-0002"
        location                      = "centralindia"
        public_network_access_enabled = false
        private_endpoint = {
          endpoint_name        = "pep-ott007-np-ci1-veegt-0002"
          subnet_id            = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-app-0007"
          connection_name      = "pep-ott007-np-ci1-veegt-0002"
          private_dns_zone_ids = ["/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.eventgrid.azure.net"]
        }
      }
      egt-ott007-dev-ci1-ve-inv-dailyshortsubtitlecreator-0003 = {
        resource_group_name           = "rg-ott007-dev-ci1-ve-0001"
        name                          = "egt-ott007-dev-ci1-ve-inv-dailyshortsubtitlecreator-0003"
        location                      = "centralindia"
        public_network_access_enabled = false
        private_endpoint = {
          endpoint_name        = "pep-ott007-np-ci1-veegt-0003"
          subnet_id            = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-app-0007"
          connection_name      = "pep-ott007-np-ci1-veegt-0003"
          private_dns_zone_ids = ["/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.eventgrid.azure.net"]
        }
      }
      egt-ott007-dev-ci1-ve-inv-posttransproc-0004 = {
        resource_group_name           = "rg-ott007-dev-ci1-ve-0001"
        name                          = "egt-ott007-dev-ci1-ve-inv-posttransproc-0004"
        location                      = "centralindia"
        public_network_access_enabled = false
        private_endpoint = {
          endpoint_name        = "pep-ott007-np-ci1-veegt-0004"
          subnet_id            = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-app-0007"
          connection_name      = "pep-ott007-np-ci1-veegt-0004"
          private_dns_zone_ids = ["/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.eventgrid.azure.net"]
        }
      }
      egt-ott007-dev-ci1-ve-inv-appendtrancdurltorssfeed-0005 = {
        resource_group_name           = "rg-ott007-dev-ci1-ve-0001"
        name                          = "egt-ott007-dev-ci1-ve-inv-appendtrancdurltorssfeed-0005"
        location                      = "centralindia"
        public_network_access_enabled = false
        private_endpoint = {
          endpoint_name        = "pep-ott007-np-ci1-veegt-0005"
          subnet_id            = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-app-0007"
          connection_name      = "pep-ott007-np-ci1-veegt-0005"
          private_dns_zone_ids = ["/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.eventgrid.azure.net"]
        }
      }
      egt-ott007-dev-ci1-ve-inv-bento4packagingfunc-0006 = {
        resource_group_name           = "rg-ott007-dev-ci1-ve-0001"
        name                          = "egt-ott007-dev-ci1-ve-inv-bento4packagingfunc-0006"
        location                      = "centralindia"
        public_network_access_enabled = false
        private_endpoint = {
          endpoint_name        = "pep-ott007-np-ci1-veegt-0006"
          subnet_id            = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-app-0007"
          connection_name      = "pep-ott007-np-ci1-veegt-0006"
          private_dns_zone_ids = ["/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.eventgrid.azure.net"]
        }
      }

      egt-ott007-dev-ci1-ve-inv-metadatahandler-0007 = {
        resource_group_name           = "rg-ott007-dev-ci1-ve-0001"
        name                          = "egt-ott007-dev-ci1-ve-inv-metadatahandler-0007"
        location                      = "centralindia"
        public_network_access_enabled = false
        private_endpoint = {
          endpoint_name        = "pep-ott007-np-ci1-veegt-0007"
          subnet_id            = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-app-0007"
          connection_name      = "pep-ott007-np-ci1-veegt-0007"
          private_dns_zone_ids = ["/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.eventgrid.azure.net"]
        }
      }

      egt-ott007-dev-ci1-ve-inv-retransnewbrsbtoateme-0008 = {
        resource_group_name           = "rg-ott007-dev-ci1-ve-0001"
        name                          = "egt-ott007-dev-ci1-ve-inv-retransnewbrsbtoateme-0008"
        location                      = "centralindia"
        public_network_access_enabled = false
        private_endpoint = {
          endpoint_name        = "pep-ott007-np-ci1-veegt-0008"
          subnet_id            = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-app-0007"
          connection_name      = "pep-ott007-np-ci1-veegt-0008"
          private_dns_zone_ids = ["/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.eventgrid.azure.net"]
        }
      }
      egt-ott007-dev-ci1-ve-inv-manifestrename-0009 = {
        resource_group_name           = "rg-ott007-dev-ci1-ve-0001"
        name                          = "egt-ott007-dev-ci1-ve-inv-manifestrename-0009"
        location                      = "centralindia"
        public_network_access_enabled = false
        private_endpoint = {
          endpoint_name        = "pep-ott007-np-ci1-veegt-0009"
          subnet_id            = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-app-0007"
          connection_name      = "pep-ott007-np-ci1-veegt-0009"
          private_dns_zone_ids = ["/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.eventgrid.azure.net"]
        }
      }
    }
  }
}
