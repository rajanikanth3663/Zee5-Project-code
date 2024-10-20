locals {
  configure_ampls_resources = {
    settings = {
      ampls-ott007-np-ci1-hub-0001 = {
        name                = "ampls-ott007-np-ci1-hub-0001"
        resource_group_name = "rg-ott007-np-ci1-hubconnectivity-0001"
        location            = "centralindia"

        private_endpoint = {
          endpoint_name   = "pep-ott007-np-ci1-hubampls-0001"
          subnet_id       = "/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubconnectivity-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-np-ci1-hub-0001/subnets/snet-ott007-np-ci1-law-0003"
          connection_name = "cmsfa-pvt-connection"
          private_dns_zone_ids = ["/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.monitor.azure.com",
            "/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.oms.opinsights.azure.com",
            "/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.ods.opinsights.azure.com",
            "/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net",
            "/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.agentsvc.azure-automation.net",
          ]
        }

        tags = {
          "service-name"       = ""
          "BusinessUnit"       = ""
          "CostCenter"         = ""
          "DisasterRecocmsry"  = ""
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
