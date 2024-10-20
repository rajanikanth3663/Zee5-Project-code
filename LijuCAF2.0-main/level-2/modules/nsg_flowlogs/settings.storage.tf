locals {
  configure_storage_resources = {
    settings = {
      storageaccount_name = "stott007npci1hub0001"
      location            = "centralindia"
      resource_group_name = "rg-ott007-np-ci1-hubconnectivity-0001"

      private_endpoint = {
        endpoint_name        = "pep-ott007-np-ci1-hubstorage-0001"
        subnet_id            = "/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubconnectivity-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-np-ci1-hub-0001/subnets/snet-ott007-np-ci1-devops-0001"
        connection_name      = "pep-ott007-np-ci1-hubstorage-0001"
        private_dns_zone_ids = ["/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net"]
      }

      network_rules = {
        virtual_network_subnet_ids = ["/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubconnectivity-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-np-ci1-hub-0001/subnets/snet-ott007-np-ci1-devops-0001"]
        #virtual_network_subnet_ids = []
        ip_rules = null
      }

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

    }
  }
}
