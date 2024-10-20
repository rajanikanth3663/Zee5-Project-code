locals {
  configure_storage_resources = {
    settings = {
      location            = "centralindia"
      resource_group_name = "rg-ott007-dev-ci1-csss-0001"
      storageaccount_name = "stott007devci1csss0001"
      network_rules = {
        virtual_network_subnet_ids = ["/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-data-0008"]
        ip_rules                   = []
      }
      containers               = []
      file_shares              = []
      queues                   = []
      tables                   = []
      account_replication_type = "ZRS"
      private_endpoint = {
        endpoint_name        = "pep-ott007-dev-ci1-csssst-0001"
        subnet_id            = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-data-0008"
        connection_name      = "stott007devci1csss0001-pvt-connection"
        private_dns_zone_ids = ["/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net"]
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