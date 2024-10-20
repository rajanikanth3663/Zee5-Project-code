locals {
  configure_storage_account_resources = {
    settings = {
      "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name}0001" = {
        location            = local.common.location
        resource_group_name = local.common.resource_group_name_csvc
        storageaccount_name = "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name}0001"
        network_rules = {
          virtual_network_subnet_ids = [local.csvc_subnet_id["snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"]]
          ip_rules                   = []
        }
        containers               = []
        file_shares              = []
        queues                   = []
        tables                   = []
        account_replication_type = "ZRS"
        private_endpoint = {
          endpoint_name        = "pep-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}st-0001"
          subnet_id            = local.csvc_subnet_id["snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"]
          connection_name      = "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name}0001-pvt-connection"
          private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/${local.common.resource_group_name_hubdns}/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net"]
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
      "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name}0002" = {
        location            = local.common.location
        resource_group_name = local.common.resource_group_name_csvc
        storageaccount_name = "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name}0002"
        network_rules = {
          virtual_network_subnet_ids = ["/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"]
          ip_rules                   = []
        }
        containers               = []
        file_shares              = []
        queues                   = []
        tables                   = []
        account_replication_type = "ZRS"
        private_endpoint = {
          endpoint_name        = "pep-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}st-0002"
          subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"
          connection_name      = "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name}0002-pvt-connection"
          private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/${local.common.resource_group_name_hubdns}/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net"]
        }

        private_endpoint_secondary = [{
          endpoint_name        = "pep-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}stweb-0002"
          subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"
          connection_name      = "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name}0002web-pvt-connection"
          private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/${local.common.resource_group_name_hubdns}/providers/Microsoft.Network/privateDnsZones/privatelink.web.core.windows.net"]
          subresource_names    = ["web"]
        }]
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

      "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name}0003" = {
        location            = local.common.location
        resource_group_name = local.common.resource_group_name_csvc
        storageaccount_name = "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name}0003"
        network_rules = {
          virtual_network_subnet_ids = ["/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"]
          ip_rules                   = []
        }
        containers                    = []
        file_shares                   = []
        queues                        = []
        tables                        = []
        account_replication_type      = "ZRS"
        public_network_access_enabled = false
        private_endpoint = {
          endpoint_name        = "pep-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}st-0003"
          subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"
          connection_name      = "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name}0003-pvt-connection"
          private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/${local.common.resource_group_name_hubdns}/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net"]
        }

        private_endpoint_secondary = [{
          endpoint_name        = "pep-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}stweb-0003"
          subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"
          connection_name      = "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name}0003web-pvt-connection"
          private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/${local.common.resource_group_name_hubdns}/providers/Microsoft.Network/privateDnsZones/privatelink.web.core.windows.net"]
          subresource_names    = ["web"]
        }]
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
      adtechstorage1 = {
        location            = local.common.location
        resource_group_name = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_adtek}-0001"
        storageaccount_name = "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name_adtek}0001"
        network_rules = {
          virtual_network_subnet_ids = ["/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"]
          ip_rules                   = []
        }
        file_shares                   = []
        queues                        = []
        tables                        = []
        account_replication_type      = "ZRS"
        public_network_access_enabled = false
        private_endpoint = {
          endpoint_name        = "pep-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_adtek}-0001"
          subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"
          connection_name      = "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name_adtek}0001-pvt-connection"
          private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/${local.common.resource_group_name_hubdns}/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net"]
        }

        containers = []
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

      "st${local.common.bu_name}${local.common.app_name_adtek}${local.common.dep_env}ci1boot002" = {
        location            = local.common.location
        resource_group_name = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_adtek}-0001"
        storageaccount_name = "st${local.common.bu_name}${local.common.app_name_adtek}${local.common.dep_env}ci1boot002"
        network_rules = {
          virtual_network_subnet_ids = ["/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"]
          ip_rules                   = []
        }
        file_shares                   = []
        queues                        = []
        tables                        = []
        account_replication_type      = "LRS"
        public_network_access_enabled = false
        private_endpoint = {
          endpoint_name        = "pep-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_adtek}-boot-diag-0001"
          subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"
          connection_name      = "st${local.common.bu_name}${local.common.app_name_adtek}${local.common.dep_env}ci1boot002-pvt-connection"
          private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/${local.common.resource_group_name_hubdns}/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net"]
        }

        containers = []
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
      "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name_cms}0002" = {
        location            = local.common.location
        resource_group_name = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_cms}-0001"
        storageaccount_name = "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name_cms}0002"
        network_rules = {
          virtual_network_subnet_ids = ["/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"]
          ip_rules                   = []
        }
        containers               = []
        file_shares              = []
        queues                   = []
        tables                   = []
        account_replication_type = "ZRS"
        private_endpoint = {
          endpoint_name        = "pep-${local.common.bu_name}-${local.common.dep_env}-ci1-sacms-0002"
          subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"
          connection_name      = "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name_cms}0002-pvt-connection"
          private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/${local.common.resource_group_name_hubdns}/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net"]
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

      "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name_cms}0001" = {
        location            = local.common.location
        resource_group_name = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_cms}-0001"
        storageaccount_name = "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name_cms}0001"
        network_rules = {
          virtual_network_subnet_ids = ["/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"]
          ip_rules                   = []
        }
        containers               = []
        file_shares              = []
        queues                   = []
        tables                   = []
        account_replication_type = "ZRS"
        private_endpoint = {
          endpoint_name        = "pep-${local.common.bu_name}-${local.common.dep_env}-ci1-sacms-0001"
          subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"
          connection_name      = "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name_cms}0001-pvt-connection"
          private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/${local.common.resource_group_name_hubdns}/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net"]
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

      "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name_cms}0003" = {
        location            = local.common.location
        resource_group_name = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_cms}-0001"
        storageaccount_name = "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name_cms}0003"
        network_rules = {
          virtual_network_subnet_ids = ["/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"]
          ip_rules                   = []
        }
        containers               = []
        file_shares              = []
        queues                   = []
        tables                   = []
        account_replication_type = "ZRS"
        private_endpoint = {
          endpoint_name        = "pep-${local.common.bu_name}-${local.common.dep_env}-ci1-sacms-0003"
          subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"
          connection_name      = "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name_cms}0002-pvt-connection"
          private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/${local.common.resource_group_name_hubdns}/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net"]
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

      "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name_cms}rss0001" = {
        location            = local.common.location
        resource_group_name = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-rssfeed-001"
        storageaccount_name = "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name_cms}rss0001"
        network_rules = {
          virtual_network_subnet_ids = ["/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"]
          ip_rules                   = []
        }
        containers               = []
        file_shares              = []
        queues                   = []
        tables                   = []
        account_replication_type = "ZRS"
        private_endpoint = {
          endpoint_name        = "pep-${local.common.bu_name}-${local.common.dep_env}-ci1-cmsrss-0001"
          subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"
          connection_name      = "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name_cms}rss0001-pvt-connection"
          private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/${local.common.resource_group_name_hubdns}/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net"]
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
      "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name_ve}0001" = {
        location                      = local.common.location
        resource_group_name           = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-0001"
        storageaccount_name           = "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name_ve}0001"
        public_network_access_enabled = true
        network_rules = {
          virtual_network_subnet_ids = [
            "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008",
            "/subscriptions/${local.sec_subscription_id}/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Network/virtualNetworks/vnet-its-np-ci1-jmp-0001/subnets/snet-its-np-ci1-jmp-0001"
          ]
          # Akamai IP addresses
          ip_rules = [
            "103.195.71.148",
            "136.226.0.0/16",
            "167.103.6.0/23",
            "165.225.192.0/18",
            "167.103.2.0/23",
            "165.225.0.0/17",
            "2.16.0.0/13",
            "23.0.0.0/12",
            "23.192.0.0/11",
            "23.32.0.0/11",
            "23.64.0.0/14",
            "23.72.0.0/13",
            "69.192.0.0/16",
            "72.246.0.0/15",
            "88.221.0.0/16",
            "92.122.0.0/15",
            "95.100.0.0/15",
            "96.16.0.0/15",
            "96.6.0.0/15",
            "104.64.0.0/10",
            "118.214.0.0/16",
            "173.222.0.0/15",
            "184.24.0.0/13",
            "184.50.0.0/15",
            "184.84.0.0/14",
            "103.195.71.144",
            "163.116.195.117",
            "45.126.189.10",
            "45.126.189.20",
            "45.126.189.30",
            "45.126.189.110",
            "45.126.189.120",
            "45.126.189.130",
            "14.192.2.114",
            "14.192.2.115",
            "45.126.191.10",
            "45.126.191.20",
            "45.126.191.30",
            "45.126.191.110",
            "45.126.191.120",
            "45.126.191.130",
            "45.126.190.10",
            "45.126.190.20",
            "45.126.190.30",
            "45.126.190.110",
            "45.126.190.120",
            "45.126.190.130",
            "103.109.86.2",
            "103.109.86.3",
            "103.109.86.4",
            "103.109.87.2",
            "103.109.87.3",
            "103.109.87.4",
            "103.109.85.2",
            "120.88.46.62",
            "103.206.105.58",
            "103.39.247.82",
            "103.77.152.114",
            "103.226.190.250",
            "103.10.135.166",
            "203.192.198.202",
            "203.192.198.206",
            "103.88.220.178",
            "103.243.114.178",
            "150.107.8.42",
            "103.171.101.254",
            "103.123.226.226",
            "45.126.188.10",
            "45.126.188.70",
            "45.126.188.71",
            "103.246.85.34",
            "103.246.84.34",
            "139.5.243.202",
            "110.235.231.202",
            "103.57.86.202",
            "182.50.69.26",
            "103.22.141.10",
            "182.48.200.122",
            "202.177.243.222",
            "203.187.215.94",
            "123.201.167.250",
            "125.99.130.254",
            "202.88.159.98",
            "202.88.160.250",
            "202.88.173.126",
            "103.26.218.66",
            "43.248.37.10",
            "43.248.37.70",
            "103.226.204.252",
            "20.33.19.112/28"
          ]
        }
        containers               = []
        file_shares              = []
        queues                   = []
        tables                   = []
        account_replication_type = "ZRS"
        private_endpoint = {
          endpoint_name        = "pep-${local.common.bu_name}-${local.common.dep_env}-ci1-save-0001"
          subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"
          connection_name      = "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name_ve}0001-pvt-connection"
          private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/${local.common.resource_group_name_hubdns}/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net"]
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

      "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name_ve}0002" = {
        location            = local.common.location
        resource_group_name = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-0001"
        storageaccount_name = "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name_ve}0002"
        network_rules = {
          virtual_network_subnet_ids = ["/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"]
          ip_rules                   = []
        }
        containers                    = []
        file_shares                   = []
        queues                        = []
        tables                        = []
        account_replication_type      = "ZRS"
        public_network_access_enabled = false
        private_endpoint = {
          endpoint_name        = "pep-${local.common.bu_name}-${local.common.dep_env}-ci1-save-0002"
          subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"
          connection_name      = "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name_ve}0002-pvt-connection"
          private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/${local.common.resource_group_name_hubdns}/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net"]
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
}
