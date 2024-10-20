locals {
  configure_aks_resources = {
    settings = {
      "aks-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001" = {
        name                    = "aks-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
        location                = local.common.location
        resource_group_name     = "${local.common.resource_group_name_csvc}"
        kubernetes_version      = "1.27.9"
        sku_tier                = "Free"
        private_cluster_enabled = true
        private_dns_zone_id     = "/subscriptions/${local.hub_subscription_id}/resourceGroups/${local.common.resource_group_name_hubdns}/providers/Microsoft.Network/privateDnsZones/privatelink.centralindia.azmk8s.io"
        # private_dns_zone_id = null

        azure_active_directory_role_based_access_control = {}
        default_node_pool = {
          node_count          = 3
          vm_size             = "Standard_D4s_v5"
          max_pods            = 30
          vnet_subnet_id      = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-aks-0002"
          enable_auto_scaling = true
          max_count           = 3
          min_count           = 2
        }
        vnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
        network_profile = {
          service_cidr   = "172.25.0.0/16"
          dns_service_ip = "172.25.0.10"
        }
        private_endpoint = {
          endpoint_name   = "pep-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcaks-0001"
          subnet_id       = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-aks-0002"
          connection_name = "akscsvc${local.common.dep_env}-pvt-connection"
        }
        azurerm_kubernetes_cluster_node_pool = [
          {
            name         = "csvc${local.common.dep_env}0001"
            vm_size      = "Standard_F16s_v2"
            min_count    = 3
            max_count    = 6
            node_count   = 3
            max_pods     = 50
            os_disk_type = "Ephemeral"
            node_labels = {
              "type"     = "user"
              "poolname" = "csvc${local.common.dep_env}0001"
            }
            vnet_subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-aks-0002"
          },
          {
            name           = "csvc${local.common.dep_env}0002"
            vm_size        = "Standard_F16s_v2"
            min_count      = 3
            max_count      = 6
            node_count     = 3
            max_pods       = 50
            os_disk_type   = "Ephemeral"
            vnet_subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-aks-0002"
            node_labels = {
              "type"     = "user"
              "poolname" = "csvc${local.common.dep_env}0002"
            }
          },
          {
            name           = "csvc${local.common.dep_env}0003"
            vm_size        = "Standard_F16s_v2"
            min_count      = 3
            max_count      = 6
            node_count     = 3
            max_pods       = 50
            os_disk_type   = "Ephemeral"
            vnet_subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-aks-0002"
            node_labels = {
              "type"     = "userv2"
              "poolname" = "csvc${local.common.dep_env}0003"
            }
          },
          {
            name           = "sch${local.common.dep_env}001"
            vm_size        = "Standard_D4as_v4"
            min_count      = 3
            max_count      = 5
            node_count     = 3
            max_pods       = 20
            vnet_subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-sch-0001"
            node_labels = {
              "type"     = "search"
              "poolname" = "sch${local.common.dep_env}001"
            }
          },
          {
            name           = "sch${local.common.dep_env}002"
            vm_size        = "Standard_D8ads_v5"
            min_count      = 4
            max_count      = 6
            node_count     = 4
            max_pods       = 20
            vnet_subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-sch-0001"
            node_labels = {
              "type"     = "search"
              "poolname" = "sch${local.common.dep_env}002"
            }
          },
          {
            name           = "sch${local.common.dep_env}003"
            vm_size        = "Standard_D16lds_v5"
            min_count      = 3
            max_count      = 5
            node_count     = 3
            max_pods       = 20
            vnet_subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-sch-0001"
            node_labels = {
              "type"     = "search"
              "poolname" = "sch${local.common.dep_env}003"
            }
          }
        ]

        oms_agent = {
          log_analytics_workspace_id      = module.law["log-${local.common.bu_name}-${local.common.dep_env}-ci1-0001"].id
          msi_auth_for_monitoring_enabled = true
        }

        prometheus = {
          name                        = "mws-${local.common.bu_name}-${local.common.dep_env}-ci1-0001"
          monitor_account_id          = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Monitor/accounts/mws-${local.common.bu_name}-${local.common.dep_env}-ci1-0001"
          data_collection_endpoint_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Insights/dataCollectionEndpoints/dce-${local.common.bu_name}-${local.common.dep_env}-ci1-0001"
        }

        azurerm_monitor_data_collection_rule = {
          streams                        = ["Microsoft-KubeNodeInventory", "Microsoft-KubePVInventory", "Microsoft-KubeServices", "Microsoft-KubeMonAgentEvents", "Microsoft-InsightsMetrics", "Microsoft-ContainerInventory", "Microsoft-ContainerNodeInventory", "Microsoft-Perf"]
          syslog_facilities              = ["auth", "authpriv", "cron", "daemon", "mark", "kern", "local0", "local1", "local2", "local3", "local4", "local5", "local6", "local7", "lpr", "mail", "news", "syslog", "user", "uucp"]
          syslog_levels                  = ["Debug", "Info", "Notice", "Warning", "Error", "Critical", "Alert", "Emergency"]
          data_collection_interval       = "1m"
          namespaces_for_data_collection = ["kube-system"]
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

      "aks-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0002" = {
        name                    = "aks-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0002"
        location                = local.common.location
        resource_group_name     = "${local.common.resource_group_name_csvc}"
        kubernetes_version      = "1.27.9"
        sku_tier                = "Free"
        private_cluster_enabled = true
        # private_dns_zone_id     = "/subscriptions/${local.hub_subscription_id}/resourceGroups/rg-${local.common.bu_name}-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.centralindia.azmk8s.io"
        # private_dns_zone_id = null

        azure_active_directory_role_based_access_control = {}
        default_node_pool = {
          node_count          = 2
          vm_size             = "Standard_D4s_v5"
          max_pods            = 25
          vnet_subnet_id      = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-aks-0003"
          enable_auto_scaling = true
          max_count           = 3
          min_count           = 2
        }
        vnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
        network_profile = {
          service_cidr   = "172.25.0.0/16"
          dns_service_ip = "172.25.0.10"
        }
        private_endpoint = {
          endpoint_name   = "pep-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcaks-0002"
          subnet_id       = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-aks-0003"
          connection_name = "akscsvc${local.common.dep_env}1-pvt-connection"
        }
        azurerm_kubernetes_cluster_node_pool = [{
          name           = "csvc2${local.common.dep_env}001"
          vm_size        = "Standard_F16s_v2"
          min_count      = 2
          max_count      = 3
          node_count     = 2
          max_pods       = 25
          os_disk_type   = "Ephemeral"
          vnet_subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-aks-0003"
          },
          {
            name           = "csvc2${local.common.dep_env}002"
            vm_size        = "Standard_F16s_v2"
            min_count      = 2
            max_count      = 3
            node_count     = 2
            max_pods       = 25
            os_disk_type   = "Ephemeral"
            vnet_subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-aks-0003"
          },
          {
            name           = "csvc2${local.common.dep_env}003"
            vm_size        = "Standard_F16s_v2"
            min_count      = 2
            max_count      = 3
            node_count     = 2
            max_pods       = 25
            os_disk_type   = "Ephemeral"
            vnet_subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-aks-0003"

            node_labels = {
              "type"     = "userv2"
              "poolname" = "csvc2${local.common.dep_env}003"
            }
          }
        ]

        oms_agent = {
          log_analytics_workspace_id      = module.law["log-${local.common.bu_name}-${local.common.dep_env}-ci1-0001"].id
          msi_auth_for_monitoring_enabled = true
        }

        prometheus = {
          name                        = "mws-${local.common.bu_name}-${local.common.dep_env}-ci1-0001"
          monitor_account_id          = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Monitor/accounts/mws-${local.common.bu_name}-${local.common.dep_env}-ci1-0001"
          data_collection_endpoint_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Insights/dataCollectionEndpoints/dce-${local.common.bu_name}-${local.common.dep_env}-ci1-0001"

        }

        azurerm_monitor_data_collection_rule = {
          # streams                        = ["Microsoft-ContainerLog", "Microsoft-ContainerLogV2", "Microsoft-KubeEvents", "Microsoft-KubePodInventory", "Microsoft-KubeNodeInventory", "Microsoft-KubePVInventory", "Microsoft-KubeServices", "Microsoft-KubeMonAgentEvents", "Microsoft-InsightsMetrics", "Microsoft-ContainerInventory", "Microsoft-ContainerNodeInventory", "Microsoft-Perf"]
          streams                        = ["Microsoft-KubeNodeInventory", "Microsoft-KubePVInventory", "Microsoft-KubeServices", "Microsoft-KubeMonAgentEvents", "Microsoft-InsightsMetrics", "Microsoft-ContainerInventory", "Microsoft-ContainerNodeInventory", "Microsoft-Perf"]
          syslog_facilities              = ["auth", "authpriv", "cron", "daemon", "mark", "kern", "local0", "local1", "local2", "local3", "local4", "local5", "local6", "local7", "lpr", "mail", "news", "syslog", "user", "uucp"]
          syslog_levels                  = ["Debug", "Info", "Notice", "Warning", "Error", "Critical", "Alert", "Emergency"]
          data_collection_interval       = "1m"
          namespaces_for_data_collection = ["kube-system"]
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

      "aks-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-0001" = {
        name                                             = "aks-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-0001"
        location                                         = local.common.location
        resource_group_name                              = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-0001"
        kubernetes_version                               = "1.26.6"
        sku_tier                                         = "Free"
        private_cluster_enabled                          = true
        azure_active_directory_role_based_access_control = {}
        default_node_pool = {
          node_count          = 3
          vm_size             = "Standard_D4s_v5"
          max_pods            = 20
          vnet_subnet_id      = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-0001"
          enable_auto_scaling = true
          max_count           = 3
          min_count           = 2
        }
        vnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-0001/providers/Microsoft.Network/virtualNetworks/"
        network_profile = {
          outbound_type  = "userDefinedRouting"
          service_cidr   = "172.25.0.0/16"
          dns_service_ip = "172.25.0.10"
        }
        private_endpoint = {
          endpoint_name   = "pep-${local.common.bu_name}-${local.common.dep_env}-ci1-veaks-0001"
          subnet_id       = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-0001"
          connection_name = "akscsvc${local.common.dep_env}-pvt-connection"
        }
        azurerm_kubernetes_cluster_node_pool = [
          {
            name         = "vems0001"
            vm_size      = "Standard_F8s_v2"
            min_count    = 3
            max_count    = 6
            node_count   = 3
            max_pods     = 20
            os_disk_type = "Ephemeral"
            node_labels = {
              "type"     = "user"
              "poolname" = "vems0001"
            }
            vnet_subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-0001"
          },
          {
            name           = "mtwrapper01"
            vm_size        = "Standard_F8s_v2"
            min_count      = 2
            max_count      = 4
            node_count     = 2
            max_pods       = 20
            os_disk_type   = "Ephemeral"
            vnet_subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-0001"
            node_labels = {
              "type"     = "user"
              "poolname" = "mtwrapper01"
            }
          }

        ]

        oms_agent = {
          log_analytics_workspace_id = module.law["log-${local.common.bu_name}-${local.common.dep_env}-ci1-0001"].id
        }

        prometheus = {
          name                        = "mws-${local.common.bu_name}-${local.common.dep_env}-ci1-0001"
          monitor_account_id          = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Monitor/accounts/mws-${local.common.bu_name}-${local.common.dep_env}-ci1-0001"
          data_collection_endpoint_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Insights/dataCollectionEndpoints/dce-${local.common.bu_name}-${local.common.dep_env}-ci1-0001"

        }

        azurerm_monitor_data_collection_rule = {
          streams                        = ["Microsoft-ContainerLog", "Microsoft-ContainerLogV2", "Microsoft-KubeEvents", "Microsoft-KubePodInventory", "Microsoft-KubeNodeInventory", "Microsoft-KubePVInventory", "Microsoft-KubeServices", "Microsoft-KubeMonAgentEvents", "Microsoft-InsightsMetrics", "Microsoft-ContainerInventory", "Microsoft-ContainerNodeInventory", "Microsoft-Perf"]
          syslog_facilities              = ["auth", "authpriv", "cron", "daemon", "mark", "kern", "local0", "local1", "local2", "local3", "local4", "local5", "local6", "local7", "lpr", "mail", "news", "syslog", "user", "uucp"]
          syslog_levels                  = ["Debug", "Info", "Notice", "Warning", "Error", "Critical", "Alert", "Emergency"]
          data_collection_interval       = "1m"
          namespaces_for_data_collection = ["kube-system"]
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

      aksz5atm1-AKS-cluster = {
        name                    = "aks-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001"
        location                = local.common.location
        resource_group_name     = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0002"
        kubernetes_version      = "1.26.6"
        sku_tier                = "Standard"
        private_cluster_enabled = true
        private_dns_zone_id     = "/subscriptions/${local.hub_subscription_id}/resourceGroups/rg-${local.common.bu_name}-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.centralindia.azmk8s.io"
        # private_dns_zone_id = null
        oidc_issuer_enabled                              = true
        workload_identity_enabled                        = true
        azure_active_directory_role_based_access_control = {}
        default_node_pool = {
          node_count          = 5
          vm_size             = "Standard_F4s_v2"
          max_pods            = 100
          vnet_subnet_id      = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_ateme}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-atemeaks-0001"
          enable_auto_scaling = true
          min_count           = 2
          max_count           = 5
          node_labels = {
            "type"     = "system"
            "pod-type" = "system"
          }
        }
        vnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_ateme}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001"
        network_profile = {
          service_cidr   = "172.25.0.0/16"
          dns_service_ip = "172.25.0.10"
        }
        private_endpoint = {
          endpoint_name   = "pep-${local.common.bu_name}-${local.common.dep_env}-ci1-atemeaks-0001"
          subnet_id       = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_ateme}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-atemeaks-0001"
          connection_name = "aksateme${local.common.dep_env}-pvt-connection"
        }
        azurerm_kubernetes_cluster_node_pool = [{
          name       = "atmperm${local.common.dep_env}1"
          vm_size    = "Standard_D16s_v5"
          min_count  = 1
          max_count  = 4
          node_count = 4
          max_pods   = 100
          node_labels = {
            "type"     = "user"
            "poolname" = "ateme${local.common.dep_env}001"
            "pod-type" = "permanent"
          }
          vnet_subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_ateme}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-atemeaks-0001"
          },
          {
            name       = "atmdypm${local.common.dep_env}1"
            vm_size    = "Standard_D16s_v5"
            min_count  = 2
            max_count  = 2
            node_count = 2
            max_pods   = 100
            node_labels = {
              "type"     = "user"
              "poolname" = "ateme${local.common.dep_env}002"
              "pod-type" = "dynamic"
            }
            vnet_subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_ateme}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-atemeaks-0001"
          },
          {
            name       = "atmdytl${local.common.dep_env}1"
            vm_size    = "Standard_D48s_v5"
            min_count  = 1
            max_count  = 2
            node_count = 2
            max_pods   = 100
            node_labels = {
              "type"     = "user"
              "poolname" = "ateme${local.common.dep_env}003"
              "pod-type" = "dynamic"
            }
            vnet_subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_ateme}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-atemeaks-0001"
          },
          {
            name       = "atmdytf${local.common.dep_env}1"
            vm_size    = "Standard_D96as_v5"
            min_count  = 1
            max_count  = 3
            node_count = 3
            max_pods   = 100
            node_labels = {
              "type"     = "user"
              "poolname" = "ateme${local.common.dep_env}004"
              "pod-type" = "dynamic"
            }
            vnet_subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_ateme}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-atemeaks-0001"
          }
        ]

        oms_agent = {
          log_analytics_workspace_id = module.law["log-${local.common.bu_name}-${local.common.dep_env}-ci1-0001"].id
        }

        prometheus = {
          name                        = "mws-${local.common.bu_name}-${local.common.dep_env}-ci1-0001"
          monitor_account_id          = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Monitor/accounts/mws-${local.common.bu_name}-${local.common.dep_env}-ci1-0001"
          data_collection_endpoint_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Insights/dataCollectionEndpoints/dce-${local.common.bu_name}-${local.common.dep_env}-ci1-0001"

        }

        azurerm_monitor_data_collection_rule = {
          streams                        = ["Microsoft-ContainerLog", "Microsoft-ContainerLogV2", "Microsoft-KubeEvents", "Microsoft-KubePodInventory", "Microsoft-KubeNodeInventory", "Microsoft-KubePVInventory", "Microsoft-KubeServices", "Microsoft-KubeMonAgentEvents", "Microsoft-InsightsMetrics", "Microsoft-ContainerInventory", "Microsoft-ContainerNodeInventory", "Microsoft-Perf"]
          syslog_facilities              = ["auth", "authpriv", "cron", "daemon", "mark", "kern", "local0", "local1", "local2", "local3", "local4", "local5", "local6", "local7", "lpr", "mail", "news", "syslog", "user", "uucp"]
          syslog_levels                  = ["Debug", "Info", "Notice", "Warning", "Error", "Critical", "Alert", "Emergency"]
          data_collection_interval       = "1m"
          namespaces_for_data_collection = ["kube-system"]
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
