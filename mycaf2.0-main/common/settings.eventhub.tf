locals {
  configure_eventhub_ns_resources = {
    settings = {

      "ehns-${local.common.bu_name}-${local.common.dep_env}-ci1-hub-0001" = {
        location                      = local.common.location
        resource_group_name           = local.common.resource_group_name_csvc
        eventhub_namespace_name       = "ehns-${local.common.bu_name}-${local.common.dep_env}-ci1-hub-0001"
        eventhub_namespace_sku        = "Standard"
        eventhub_namespace_capacity   = 1
        public_network_access_enabled = false

        private_endpoint = {
          endpoint_name        = "pep-${local.common.dep_env}-${local.common.dep_env}-ci1-hub-0002"
          connection_name      = "pep-${local.common.dep_env}-${local.common.dep_env}-ci1-hub-0002"
          subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
          private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/${local.common.resource_group_name_hubdns}/providers/Microsoft.Network/privateDnsZones/privatelink.servicebus.windows.net"]
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
      "ehns-${local.common.bu_name}-${local.common.dep_env}-ci1-hub-0002" = {

        location                      = local.common.location
        resource_group_name           = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
        eventhub_namespace_name       = "ehns-${local.common.bu_name}-${local.common.dep_env}-ci1-hub-0002"
        eventhub_namespace_sku        = "Standard"
        eventhub_namespace_capacity   = 1
        public_network_access_enabled = false
        private_endpoint = {
          endpoint_name        = "pep-${local.common.dep_env}-${local.common.dep_env}-ci1-ehub-0002"
          connection_name      = "pep-${local.common.dep_env}-${local.common.dep_env}-ci1-ehub-0002"
          subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
          private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/${local.common.resource_group_name_hubdns}/providers/Microsoft.Network/privateDnsZones/privatelink.servicebus.windows.net"]
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

      "ehns-${local.common.bu_name}-${local.common.dep_env}-ci1-hub-0003" = {

        location                      = local.common.location
        resource_group_name           = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
        eventhub_namespace_name       = "ehns-${local.common.bu_name}-${local.common.dep_env}-ci1-hub-0003"
        eventhub_namespace_sku        = "Premium"
        eventhub_namespace_capacity   = 1
        public_network_access_enabled = false
        zone_redundant                = true
        private_endpoint = {
          endpoint_name        = "pep-${local.common.dep_env}-${local.common.dep_env}-ci1-ehub-0003"
          connection_name      = "pep-${local.common.dep_env}-${local.common.dep_env}-ci1-ehub-0003"
          subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
          private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/${local.common.resource_group_name_hubdns}/providers/Microsoft.Network/privateDnsZones/privatelink.servicebus.windows.net"]
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
      "ehdedns-${local.common.bu_name}-${local.common.dep_env}-ci1-hub-0001" = {

        location                      = "centralindia"
        resource_group_name           = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
        eventhub_namespace_name       = "ehdedns-${local.common.bu_name}-${local.common.dep_env}-ci1-hub-0001"
        eventhub_namespace_sku        = "Standard"
        dedicated_cluster_id          = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.EventHub/clusters/ehcls-${local.common.bu_name}-${local.common.dep_env}-ci1-hub-0001"
        eventhub_namespace_capacity   = 1
        public_network_access_enabled = false
        private_endpoint = {
          endpoint_name        = "pep-ehcls-${local.common.dep_env}-ci1-ehub-0003"
          connection_name      = "pep-ehcls-${local.common.dep_env}-ci1-ehub-0003"
          subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
          private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/${local.common.resource_group_name_hubdns}/providers/Microsoft.Network/privateDnsZones/privatelink.servicebus.windows.net"]
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
      "ehns-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_cms}-0001" = {
        location                      = local.common.location
        resource_group_name           = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-rssfeed-001"
        eventhub_namespace_name       = "ehns-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_cms}-0001"
        eventhub_namespace_sku        = "Standard"
        eventhub_namespace_capacity   = 1
        public_network_access_enabled = false

        private_endpoint = {
          endpoint_name        = "pep-${local.common.dep_env}-${local.common.dep_env}-ci1-${local.common.app_name_cms}-0001"
          connection_name      = "pvt-connection-${local.common.dep_env}-${local.common.dep_env}-ci1-${local.common.app_name_cms}-0001"
          subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
          private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/${local.common.resource_group_name_hubdns}/providers/Microsoft.Network/privateDnsZones/privatelink.servicebus.windows.net"]
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
