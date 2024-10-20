locals {
  configure_connectivity_resources = {
    settings = {
      hub_networks = [
        {
          enabled = true
          config = {
            address_space                = ["10.171.32.0/22", "10.171.44.0/23"]
            location                     = "centralindia"
            link_to_ddos_protection_plan = false
            dns_servers                  = []
            bgp_community                = ""
            subnets = [
              {
                name             = "snet-ott007-np-ci1-devops-0001"
                address_prefixes = ["10.171.32.0/23"]
              },
              {
                name             = "snet-ott007-np-ci1-devops-0002"
                address_prefixes = ["10.171.44.0/23"]
              },
              {
                name             = "snet-ott007-np-ci1-ampls-0003"
                address_prefixes = ["10.171.34.128/27"]
              }
            ]
            azure_firewall = {
              enabled = true
              config = {
                address_prefix                = "10.171.34.0/26"
                address_management_prefix     = "10.171.34.192/26"
                enable_dns_proxy              = true
                dns_servers                   = []
                sku_tier                      = "Standard"
                base_policy_id                = ""
                private_ip_ranges             = []
                threat_intelligence_mode      = ""
                threat_intelligence_allowlist = []
                availability_zones = {
                  zone_1 = true
                  zone_2 = true
                  zone_3 = true
                }
              }
            }
            spoke_virtual_network_resource_ids      = []
            enable_outbound_virtual_network_peering = true
            enable_hub_network_mesh_peering         = false
          }
        }
      ]
      vwan_hub_networks = []
      ddos_protection_plan = {
        enabled = false
        config = {
          location = "centralindia"
        }
      }
      dns = {
        enabled = true
        config = {
          location = null
          enable_private_link_by_service = {
            azure_api_management                 = true
            azure_app_configuration_stores       = false
            azure_arc                            = false
            azure_automation_dscandhybridworker  = false
            azure_automation_webhook             = false
            azure_backup                         = false
            azure_batch_account                  = false
            azure_bot_service_bot                = false
            azure_bot_service_token              = false
            azure_cache_for_redis                = true
            azure_cache_for_redis_enterprise     = true
            azure_container_registry             = true
            azure_cosmos_db_cassandra            = true
            azure_cosmos_db_gremlin              = true
            azure_cosmos_db_mongodb              = true
            azure_cosmos_db_sql                  = true
            azure_cosmos_db_table                = true
            azure_data_explorer                  = false
            azure_data_factory                   = true
            azure_data_factory_portal            = true
            azure_data_health_data_services      = false
            azure_data_lake_file_system_gen2     = true
            azure_database_for_mariadb_server    = false
            azure_database_for_mysql_server      = true
            azure_database_for_postgresql_server = true
            azure_detailzz_twins                  = false
            azure_event_grid_domain              = false
            azure_event_grid_topic               = false
            azure_event_hubs_namespace           = false
            azure_file_sync                      = false
            azure_hdinsights                     = false
            azure_iot_dps                        = false
            azure_iot_hub                        = false
            azure_key_vault                      = true
            azure_key_vault_managed_hsm          = false
            azure_kubernetes_service_management  = true
            azure_machine_learning_workspace     = false
            azure_managed_disks                  = false
            azure_media_services                 = false
            azure_migrate                        = false
            azure_monitor                        = true
            azure_purview_account                = false
            azure_purview_studio                 = false
            azure_relay_namespace                = false
            azure_search_service                 = true
            azure_service_bus_namespace          = true
            azure_site_recovery                  = false
            azure_sql_database_sqlserver         = true
            azure_synapse_analytics_dev          = false
            azure_synapse_analytics_sql          = false
            azure_synapse_studio                 = false
            azure_web_apps_sites                 = true
            azure_web_apps_static_sites          = false
            cognitive_services_account           = true
            microsoft_power_bi                   = false
            signalr                              = false
            signalr_webpubsub                    = false
            storage_account_blob                 = true
            storage_account_file                 = true
            storage_account_queue                = true
            storage_account_table                = true
            storage_account_web                  = true
          }
          private_link_locations = [
            "centralindia"
          ]
          public_dns_zones                                       = []
          private_dns_zones                                      = []
          enable_private_dns_zone_virtual_network_link_on_hubs   = true
          enable_private_dns_zone_virtual_network_link_on_spokes = true
          virtual_network_resource_ids_to_link = [
            "/subscriptions/951bb481-cd31-4ad0-add8-6914f12d4849/resourceGroups/rg-ott007-uat-ci1-ateme-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-uat-ci1-ateme-0001",
            "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001",
            "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-medthek-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-medthek-0001",
            "/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubconnectivity-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-np-ci1-hub-0001",
            "/subscriptions/93d7fd7e-3393-4ac8-af39-6898264b1f36/resourceGroups/rg-ott007-qa-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-qa-ci1-csss-0001",
            "/subscriptions/93d7fd7e-3393-4ac8-af39-6898264b1f36/resourceGroups/rg-ott007-qa-ci1-medthek-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-qa-ci1-medthek-0001",
            "/subscriptions/951bb481-cd31-4ad0-add8-6914f12d4849/resourceGroups/rg-ott007-uat-ci1-medthek-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-uat-ci1-medthek-0001",
            "/subscriptions/951bb481-cd31-4ad0-add8-6914f12d4849/resourceGroups/rg-ott007-uat-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-uat-ci1-csss-0001",
            "/subscriptions/acc1986a-f53e-4a17-ae8f-3beff287c331/resourceGroups/rg-ott007-qa-ci1-data-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-qa-ci1-data-0001",
            "/subscriptions/acc1986a-f53e-4a17-ae8f-3beff287c331/resourceGroups/rg-ott007-uat-ci1-data-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-uat-ci1-data-0001",
            "/subscriptions/3bdbfb2d-3363-49ee-b860-41fb3d2f43c2/resourceGroups/rg-ott007-uat-ci1-datamgmt-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-uat-ci1-datamgmt-0001",
            "/subscriptions/3bdbfb2d-3363-49ee-b860-41fb3d2f43c2/resourceGroups/rg-ott007-dev-ci1-datamgmt-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-datamgmt-0001",
            "/subscriptions/3bdbfb2d-3363-49ee-b860-41fb3d2f43c2/resourceGroups/rg-ott007-qa-ci1-datamgmt-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-qa-ci1-datamgmt-0001",
            "/subscriptions/acc1986a-f53e-4a17-ae8f-3beff287c331/resourceGroups/rg-ott007-dev-ci1-data-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-data-0001"
          ]
        }
      }
    }

    location = var.primary_location
    tags     = var.connectivity_resources_tags
    advanced = {
      custom_settings_by_resource_type = {
        azurerm_resource_group = {
          connectivity = {
            (var.primary_location) = {
              name = "rg-ott007-np-ci1-hubconnectivity-0001"
            }
          }
          ddos = {
            (var.primary_location) = {
              name = "rg-ott007-np-ci1-hubddos-0001"
            }
          }
          dns = {
            (var.primary_location) = {
              name = "rg-ott007-np-ci1-hubdns-0001"
            }
          }
        }
        azurerm_network_ddos_protection_plan = {
          ddos = {
            (var.primary_location) = {
              name = "ddos-ott007-np-ci1-001"
            }
          }
        }
        azurerm_private_dns_zone = {
          connectivity = {
            (var.primary_location) = {
              name = "dns-ott007-np-ci1-001"
            }
          }
        }
        azurerm_firewall = {
          connectivity = {
            (var.primary_location) = {
              name = "afw-ott007-np-ci1-hub-0001"
              ip_configuration = [{
                name                 = "pip_configuration"
                public_ip_address_id = "/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubconnectivity-0001/providers/Microsoft.Network/publicIPAddresses/pip-ott007-np-ci1-afw-0001"
                subnet_id            = "/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubconnectivity-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-np-ci1-hub-0001/subnets/AzureFirewallSubnet"
              }]
              management_ip_configuration = [{
                name                 = "management_ip_configuration"
                public_ip_address_id = "/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubconnectivity-0001/providers/Microsoft.Network/publicIPAddresses/pip-ott007-np-ci1-afwmgmt-0001"
                subnet_id            = "/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubconnectivity-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-np-ci1-hub-0001/subnets/AzureFirewallManagementSubnet"
              }]
            }
          }
        }
        azurerm_firewall_policy = {
          connectivity = {
            (var.primary_location) = {
              name = "afwp-ott007-np-ci1-hub-httpsallow-0001"
            }
          }
        }
        azurerm_subnet = {
          connectivity = {
            (var.primary_location) = {
              "snet-ott007-np-ci1-devops-0001" = {
                service_endpoints = ["Microsoft.Storage"]
              }
            }
          }
        }
        azurerm_virtual_network = {
          connectivity = {
            (var.primary_location) = {
              name = "vnet-ott007-np-ci1-hub-0001"
            }
          }
        }
      }
    }
  }
}
