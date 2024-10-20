locals {
  configure_ampls_resources = {
    settings = {
      ampls-ott007-np-ci1-hub-0001 = {
        name                = "ampls-ott007-np-ci1-hub-0001"
        resource_group_name = "rg-ott007-np-ci1-hubconnectivity-0001"

        private_endpoint = {
          endpoint_name        = "pep-ott007-np-ci1-hubampls-0001"
          subnet_id            = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-app-0007"
          connection_name      = "cmsfa-pvt-connection"
          private_dns_zone_ids = ["/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.azurewebsites.net"]
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
