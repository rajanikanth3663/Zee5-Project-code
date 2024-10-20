locals {
  configure_eventhub = {
    settings = {

      location                      = "central india"
      resource_group_name           = "rg-ott007-dev-ci1-csss-0001"
      eventhub_namespace_name       = "ehns-ott007-dev-ci1-hub-0001"
      eventhub_namespace_sku        = "Standard"
      eventhub_namespace_capacity   = 1
      public_network_access_enabled = false

      private_endpoint = {
        endpoint_name        = "pep-dev-dev-ci1-hub-0002"
        connection_name      = "pep-dev-dev-ci1-hub-0002"
        subnet_id            = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-app-0007"
        private_dns_zone_ids = ["/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.servicebus.windows.net"]
      }
      identity = {
        type = "SystemAssigned"
      }


      minimum_tls_version = "1.2"

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

  configure_eventhubs = {
    settings = {
      ehns-ott007-dev-ci1-hub-0002 = {

        location                      = "central india"
        resource_group_name           = "rg-ott007-dev-ci1-csss-0001"
        eventhub_namespace_name       = "ehns-ott007-dev-ci1-hub-0002"
        eventhub_namespace_sku        = "Standard"
        eventhub_namespace_capacity   = 1
        public_network_access_enabled = false
        private_endpoint = {
          endpoint_name        = "pep-dev-dev-ci1-ehub-0002"
          connection_name      = "pep-dev-dev-ci1-ehub-0002"
          subnet_id            = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-app-0007"
          private_dns_zone_ids = ["/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.servicebus.windows.net"]
        }
        identity = {
          type = "SystemAssigned"
        }


        minimum_tls_version = "1.2"

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

      ehns-ott007-dev-ci1-hub-0003 = {

        location                      = "central india"
        resource_group_name           = "rg-ott007-dev-ci1-csss-0001"
        eventhub_namespace_name       = "ehns-ott007-dev-ci1-hub-0003"
        eventhub_namespace_sku        = "Premium"
        eventhub_namespace_capacity   = 1
        public_network_access_enabled = false
        zone_redundant                = true
        private_endpoint = {
          endpoint_name        = "pep-dev-dev-ci1-ehub-0003"
          connection_name      = "pep-dev-dev-ci1-ehub-0003"
          subnet_id            = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-app-0007"
          private_dns_zone_ids = ["/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.servicebus.windows.net"]
        }
        identity = {
          type = "SystemAssigned"
        }


        minimum_tls_version = "1.2"

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
      ehns-ott007-dev-ci1-dedhub-0001 = {

        location                      = "central india"
        resource_group_name           = "rg-ott007-dev-ci1-csss-0001"
        eventhub_namespace_name       = "ehns-ott007-dev-ci1-dedhub-0001"
        eventhub_namespace_sku        = "Standard"
        dedicated_cluster_id          = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.EventHub/clusters/eventhubcluster-ott007-dev-ci1-csss-0001"
        eventhub_namespace_capacity   = 1
        public_network_access_enabled = false
        private_endpoint = {
          endpoint_name        = "pep-dev-dev-ci1-dedehub-0001"
          connection_name      = "pep-dev-dev-ci1-dedehub-0003"
          subnet_id            = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-app-0007"
          private_dns_zone_ids = ["/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.servicebus.windows.net"]
        }
        identity = {
          type = "SystemAssigned"
        }


        minimum_tls_version = "1.2"

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
}
