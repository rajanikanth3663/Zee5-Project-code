locals {
  configure_aks_resources = {
    settings = {
      name                    = "aks-ott007-dev-ci1-csss-0001"
      location                = "centralindia"
      resource_group_name     = "rg-ott007-dev-ci1-csss-0001"
      kubernetes_version      = "1.26.6"
      sku_tier                = "Free"
      private_cluster_enabled = true
      private_dns_zone_id     = "/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.centralindia.azmk8s.io"
      # private_dns_zone_id = null

      azure_active_directory_role_based_access_control = {}
      default_node_pool = {
        node_count     = 3
        vm_size        = "Standard_D4s_v5"
        max_pods       = 30
        vnet_subnet_id = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-aks-0002"
      }
      vnet_id = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001"
      network_profile = {
        service_cidr   = "172.25.0.0/16"
        dns_service_ip = "172.25.0.10"
      }
      private_endpoint = {
        endpoint_name   = "pep-ott007-dev-ci1-csssaks-0001"
        subnet_id       = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-aks-0002"
        connection_name = "akscsssdev-pvt-connection"
      }
      azurerm_kubernetes_cluster_node_pool = [{
        name         = "csssdev001"
        vm_size      = "Standard_F16s_v2"
        min_count    = 3
        max_count    = 6
        node_count   = 3
        max_pods     = 30
        os_disk_type = "Ephemeral"
        node_labels = {
          "type"     = "user"
          "poolname" = "csssdev001"
        }
        vnet_subnet_id = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-aks-0002"
        },
        {
          name           = "csssdev002"
          vm_size        = "Standard_F16s_v2"
          min_count      = 3
          max_count      = 6
          node_count     = 3
          max_pods       = 30
          os_disk_type   = "Ephemeral"
          vnet_subnet_id = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-aks-0002"
          node_labels = {
            "type"     = "user"
            "poolname" = "csssdev002"
          }
        }
      ]
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

    aks2 = {
      name                    = "aks-ott007-dev-ci1-csss-0002"
      location                = "centralindia"
      resource_group_name     = "rg-ott007-dev-ci1-csss-0001"
      kubernetes_version      = "1.26.6"
      sku_tier                = "Free"
      private_cluster_enabled = true
      # private_dns_zone_id     = "/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.centralindia.azmk8s.io"
      # private_dns_zone_id = null

      azure_active_directory_role_based_access_control = {}
      default_node_pool = {
        node_count     = 2
        vm_size        = "Standard_F16s_v2"
        max_pods       = 25
        vnet_subnet_id = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-aks-0003"
      }
      vnet_id = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001"
      network_profile = {
        service_cidr   = "172.25.0.0/16"
        dns_service_ip = "172.25.0.10"
      }
      private_endpoint = {
        endpoint_name   = "pep-ott007-dev-ci1-csssaks-0002"
        subnet_id       = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-aks-0003"
        connection_name = "akscsssdev1-pvt-connection"
      }
      azurerm_kubernetes_cluster_node_pool = [{
        name           = "csss2dev001"
        vm_size        = "Standard_F16s_v2"
        min_count      = 2
        max_count      = 3
        node_count     = 2
        max_pods       = 25
        os_disk_type   = "Ephemeral"
        vnet_subnet_id = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-aks-0003"
        },
        {
          name           = "csss2dev002"
          vm_size        = "Standard_F16s_v2"
          min_count      = 2
          max_count      = 3
          node_count     = 2
          max_pods       = 25
          os_disk_type   = "Ephemeral"
          vnet_subnet_id = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-aks-0003"
        }
      ]
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
