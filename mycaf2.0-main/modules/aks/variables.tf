variable "settings" {
  description = "Configure AKS resources"
  type = object({
    location            = string
    resource_group_name = string
    name                = string
    kubernetes_version  = optional(string, "1.25.0")
    sku_tier            = optional(string, "Standard")
    node_resource_group = optional(string, null)
    #node_resource_group          = optional(string, "MC_${resource_group_name}_${name}_${location}")
    custom_dns_zone_enabled       = optional(bool, true)
    private_cluster_enabled       = bool
    private_dns_zone_id           = optional(string, null)
    azure_policy_enabled          = optional(bool, true)
    public_network_access_enabled = optional(bool, false)
    oidc_issuer_enabled           = optional(bool, false)
    workload_identity_enabled     = optional(bool, false)

    vnet_id = string
    default_node_pool = object({
      name                        = optional(string, "default")
      node_count                  = number
      vm_size                     = optional(string, "Standard_D2_v2")
      enable_auto_scaling         = optional(bool, false)
      enable_node_public_ip       = optional(bool, false)
      vnet_subnet_id              = string
      max_pods                    = number
      temporary_name_for_rotation = optional(string, "tempnodepool")
      node_labels                 = optional(map(any), null)
      max_count                   = optional(number)
      min_count                   = optional(number)
    })

    identity = optional(object({
      type = optional(string, "SystemAssigned")
    }))

    network_profile = object({
      load_balancer_sku = optional(string, "standard")
      service_cidr      = string
      dns_service_ip    = string
      outbound_type     = optional(string, "loadBalancer")

    })

    private_endpoint = object({
      endpoint_name   = string
      subnet_id       = string
      connection_name = string
    })

    azure_active_directory_role_based_access_control = optional(object({
      managed            = optional(bool, true)
      azure_rbac_enabled = optional(bool, true)
    }))

    key_vault_secrets_provider = optional(object({
      secret_rotation_enabled  = optional(bool, true)
      secret_rotation_interval = optional(string, "2m")
    }), {})

    azurerm_kubernetes_cluster_node_pool = list(object({
      name                   = optional(string, "internal")
      vm_size                = optional(string, "Standard_DS2_v2")
      node_count             = optional(number, 1)
      os_type                = optional(string, "Linux")
      zones                  = optional(list(number), [1, 2, 3])
      enable_auto_scaling    = optional(bool, true)
      min_count              = optional(number, 1)
      max_count              = optional(number, 10)
      type                   = optional(string, "VirtualMachineScaleSets")
      node_taints            = optional(list(any), null)
      node_labels            = optional(map(any), null)
      orchestrator_version   = optional(string, null)
      priority               = optional(string, null)
      enable_host_encryption = optional(bool, null)
      eviction_policy        = optional(string, null)
      os_disk_type           = optional(string, "Managed")
      os_disk_size_gb        = optional(number, 128)
      enable_node_public_ip  = optional(bool, false)
      vnet_subnet_id         = optional(string, null)
      max_pods               = number

      upgrade_settings = optional(object({
        max_surge = string
      }))

    }))
    tags = optional(map(string), null)


    # oms_agent = optional(object({
    #   log_analytics_workspace_id = optional(string)
    # }))



  })
}
