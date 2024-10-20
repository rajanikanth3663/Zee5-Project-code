locals {
  vnet_peer_configurations = {
    settings = {
      spoketohub = {
        name                      = "peer-vnet-ott007-dev-ci1-csss-0001-to-${data.azurerm_virtual_network.this.name}"
        resource_group_name       = "rg-ott007-dev-ci1-csss-0001"
        virtual_network_name      = "vnet-ott007-dev-ci1-csss-0001"
        remote_virtual_network_id = data.azurerm_virtual_network.this.id
      }
      hubtospoke = {
        name                      = "peer-${data.azurerm_virtual_network.this.name}-to-vnet-ott007-dev-ci1-csss-0001"
        resource_group_name       = data.azurerm_virtual_network.this.resource_group_name
        virtual_network_name      = data.azurerm_virtual_network.this.name
        remote_virtual_network_id = "/subscriptions/${data.azurerm_client_config.core.subscription_id}/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001"
      }

      medthektohub = {
        name                      = "peer-vnet-ott007-dev-ci1-medthek-0001-to-${data.azurerm_virtual_network.this.name}"
        resource_group_name       = "rg-ott007-dev-ci1-medthek-0001"
        virtual_network_name      = "vnet-ott007-dev-ci1-medthek-0001"
        remote_virtual_network_id = data.azurerm_virtual_network.this.id
      }

      hubtomedthek = {
        name                      = "peer-${data.azurerm_virtual_network.this.name}-to-vnet-ott007-dev-ci1-medthek-0001"
        resource_group_name       = data.azurerm_virtual_network.this.resource_group_name
        virtual_network_name      = data.azurerm_virtual_network.this.name
        remote_virtual_network_id = "/subscriptions/${data.azurerm_client_config.core.subscription_id}/resourceGroups/rg-ott007-dev-ci1-medthek-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-medthek-0001"
      }

      atemetohub = {
        name                      = "peer-vnet-ott007-dev-ci1-ateme-0001-to-${data.azurerm_virtual_network.this.name}"
        resource_group_name       = "rg-ott007-dev-ci1-ateme-0001"
        virtual_network_name      = "vnet-ott007-dev-ci1-ateme-0001"
        remote_virtual_network_id = data.azurerm_virtual_network.this.id
      }

      hubtoateme = {
        name                      = "peer-${data.azurerm_virtual_network.this.name}-to-vnet-ott007-dev-ci1-ateme-0001"
        resource_group_name       = data.azurerm_virtual_network.this.resource_group_name
        virtual_network_name      = data.azurerm_virtual_network.this.name
        remote_virtual_network_id = "/subscriptions/${data.azurerm_client_config.core.subscription_id}/resourceGroups/rg-ott007-dev-ci1-ateme-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-ateme-0001"
      }
      atemetocsss = {
        name                      = "peer-vnet-ott007-dev-ci1-ateme-0001-to-vnet-ott007-dev-ci1-csss-0001"
        resource_group_name       = "rg-ott007-dev-ci1-ateme-0001"
        virtual_network_name      = "vnet-ott007-dev-ci1-ateme-0001"
        remote_virtual_network_id = "/subscriptions/${data.azurerm_client_config.core.subscription_id}/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001"
      }

      cssstoateme = {
        name                      = "peer-vnet-ott007-dev-ci1-csss-0001-to-peer-vnet-ott007-dev-ci1-ateme-0001"
        resource_group_name       = "rg-ott007-dev-ci1-csss-0001"
        virtual_network_name      = "vnet-ott007-dev-ci1-csss-0001"
        remote_virtual_network_id = "/subscriptions/${data.azurerm_client_config.core.subscription_id}/resourceGroups/rg-ott007-dev-ci1-ateme-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-ateme-0001"
      }

      atemetocsss = {
        name                      = "peer-vnet-ott007-dev-ci1-ateme-0001-to-vnet-ott007-dev-ci1-csss-0001"
        resource_group_name       = "rg-ott007-dev-ci1-ateme-0001"
        virtual_network_name      = "vnet-ott007-dev-ci1-ateme-0001"
        remote_virtual_network_id = "/subscriptions/${data.azurerm_client_config.core.subscription_id}/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001"
      }

      cssstoateme = {
        name                      = "peer-vnet-ott007-dev-ci1-csss-0001-to-peer-vnet-ott007-dev-ci1-ateme-0001"
        resource_group_name       = "rg-ott007-dev-ci1-csss-0001"
        virtual_network_name      = "vnet-ott007-dev-ci1-csss-0001"
        remote_virtual_network_id = "/subscriptions/${data.azurerm_client_config.core.subscription_id}/resourceGroups/rg-ott007-dev-ci1-ateme-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-ateme-0001"
      }
    }
  }
}
