locals {
  vnet_peer_configurations = {
    settings = {
      spoketohub = {
        name                      = "peer-vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001-to-${data.azurerm_virtual_network.this.name}"
        resource_group_name       = local.common.resource_group_name_csvc
        virtual_network_name      = "vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
        remote_virtual_network_id = data.azurerm_virtual_network.this.id
      }
      hubtospoke = {
        name                      = "peer-${data.azurerm_virtual_network.this.name}-to-vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
        resource_group_name       = data.azurerm_virtual_network.this.resource_group_name
        virtual_network_name      = data.azurerm_virtual_network.this.name
        remote_virtual_network_id = "/subscriptions/${data.azurerm_client_config.core.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
      }

      medthektohub = {
        name                      = "peer-vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-medthek-0001-to-${data.azurerm_virtual_network.this.name}"
        resource_group_name       = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-medthek-0001"
        virtual_network_name      = "vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-medthek-0001"
        remote_virtual_network_id = data.azurerm_virtual_network.this.id
      }

      hubtomedthek = {
        name                      = "peer-${data.azurerm_virtual_network.this.name}-to-vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-medthek-0001"
        resource_group_name       = data.azurerm_virtual_network.this.resource_group_name
        virtual_network_name      = data.azurerm_virtual_network.this.name
        remote_virtual_network_id = "/subscriptions/${data.azurerm_client_config.core.subscription_id}/resourceGroups/rg-${local.common.bu_name}-${local.common.dep_env}-ci1-medthek-0001/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-medthek-0001"
      }

      atemetohub = {
        name                      = "peer-vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001-to-${data.azurerm_virtual_network.this.name}"
        resource_group_name       = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001"
        virtual_network_name      = "vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001"
        remote_virtual_network_id = data.azurerm_virtual_network.this.id
      }

      hubtoateme = {
        name                      = "peer-${data.azurerm_virtual_network.this.name}-to-vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001"
        resource_group_name       = data.azurerm_virtual_network.this.resource_group_name
        virtual_network_name      = data.azurerm_virtual_network.this.name
        remote_virtual_network_id = "/subscriptions/${data.azurerm_client_config.core.subscription_id}/resourceGroups/${local.common.resource_group_name_ateme}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001"
      }
      atemetocsvc = {
        name                      = "peer-vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001-to-vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
        resource_group_name       = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001"
        virtual_network_name      = "vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001"
        remote_virtual_network_id = "/subscriptions/${data.azurerm_client_config.core.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
      }

      csvctoateme = {
        name                      = "peer-vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001-to-peer-vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001"
        resource_group_name       = local.common.resource_group_name_csvc
        virtual_network_name      = "vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
        remote_virtual_network_id = "/subscriptions/${data.azurerm_client_config.core.subscription_id}/resourceGroups/${local.common.resource_group_name_ateme}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001"
      }

      atemetocsvc = {
        name                      = "peer-vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001-to-vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
        resource_group_name       = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001"
        virtual_network_name      = "vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001"
        remote_virtual_network_id = "/subscriptions/${data.azurerm_client_config.core.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
      }

      csvctoateme = {
        name                      = "peer-vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001-to-peer-vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001"
        resource_group_name       = local.common.resource_group_name_csvc
        virtual_network_name      = "vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
        remote_virtual_network_id = "/subscriptions/${data.azurerm_client_config.core.subscription_id}/resourceGroups/${local.common.resource_group_name_ateme}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001"
      }

      "ateme${local.common.dep_env}tohub" = {
        name                      = "peer-vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001-to-${data.azurerm_virtual_network.this.name}"
        resource_group_name       = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001"
        virtual_network_name      = "vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001"
        remote_virtual_network_id = data.azurerm_virtual_network.this.id
      }

      "hubtoateme${local.common.dep_env}" = {
        name                      = "peer-${data.azurerm_virtual_network.this.name}-to-vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001"
        resource_group_name       = data.azurerm_virtual_network.this.resource_group_name
        virtual_network_name      = data.azurerm_virtual_network.this.name
        remote_virtual_network_id = "/subscriptions/${data.azurerm_client_config.core.subscription_id}/resourceGroups/${local.common.resource_group_name_ateme}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001"
      }

      "ateme${local.common.dep_env}tocsvc" = {
        name                      = "peer-vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001-to-vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
        resource_group_name       = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001"
        virtual_network_name      = "vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001"
        remote_virtual_network_id = "/subscriptions/${data.azurerm_client_config.core.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
      }

      "csvctoateme${local.common.dep_env}" = {
        name                      = "peer-vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001-to-peer-vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001"
        resource_group_name       = local.common.resource_group_name_csvc
        virtual_network_name      = "vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
        remote_virtual_network_id = "/subscriptions/${data.azurerm_client_config.core.subscription_id}/resourceGroups/${local.common.resource_group_name_ateme}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001"
      }
    }
  }
}
