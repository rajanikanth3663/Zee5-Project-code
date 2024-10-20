locals {
  configure_aks_resources = {
    settings = {
      name                                             = "aks-ott007-np-ci1-argo-0001"
      location                                         = "centralindia"
      resource_group_name                              = "rg-ott007-np-ci1-hubdevops-0001"
      kubernetes_version                               = "1.26.6"
      sku_tier                                         = "Free"
      private_cluster_enabled                          = true
      private_dns_zone_id                              = "/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.centralindia.azmk8s.io"
      azure_active_directory_role_based_access_control = {}
      default_node_pool = {
        node_count     = 1
        min_count      = 1
        max_count      = 2
        vm_size        = "Standard_D2_v2"
        max_pods       = 50
        vnet_subnet_id = "/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubconnectivity-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-np-ci1-hub-0001/subnets/snet-ott007-np-ci1-devops-0001"
      }
      vnet_id = "/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubconnectivity-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-np-ci1-hub-0001"
      network_profile = {
        service_cidr   = "172.25.0.0/16"
        dns_service_ip = "172.25.0.10"
      }
      private_endpoint = {
        endpoint_name   = "pep-ott007-np-ci1-argoaks-0001"
        subnet_id       = "/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubconnectivity-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-np-ci1-hub-0001/subnets/snet-ott007-np-ci1-devops-0001"
        connection_name = "aksargo-pvt-connection"
      }
      azurerm_kubernetes_cluster_node_pool = [{
        name           = "akshubargo01"
        vm_size        = "Standard_DS2_v2"
        min_count      = 2
        max_count      = 3
        node_count     = 2
        max_pods       = 50
        vnet_subnet_id = "/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubconnectivity-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-np-ci1-hub-0001/subnets/snet-ott007-np-ci1-devops-0001"
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
  }
}
