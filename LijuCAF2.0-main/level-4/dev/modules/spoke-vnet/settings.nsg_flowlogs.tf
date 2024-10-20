locals {
  configure_nsg_flowlogs_resources = {
    settings = [
      {
        name                      = "nsg-ott007-dev-ci1-apim-0001-flowlog-0001"
        location                  = "centralindia"
        resource_group_name       = "NetworkWatcherRG"
        network_watcher_name      = "NetworkWatcher_centralindia"
        network_security_group_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/networkSecurityGroups/nsg-ott007-dev-ci1-apim-0001"
        storage_account_id        = data.azurerm_storage_account.this.id

        traffic_analytics = {
          enabled               = true
          workspace_id          = data.azurerm_log_analytics_workspace.this.workspace_id
          workspace_region      = "centralindia"
          workspace_resource_id = data.azurerm_log_analytics_workspace.this.id
          interval_in_minutes   = 10
        }
      },
      {
        name                      = "nsg-ott007-dev-ci1-aks-0002-flowlog-0001"
        location                  = "centralindia"
        resource_group_name       = "NetworkWatcherRG"
        network_watcher_name      = "NetworkWatcher_centralindia"
        network_security_group_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/networkSecurityGroups/nsg-ott007-dev-ci1-aks-0002"
        storage_account_id        = data.azurerm_storage_account.this.id

        traffic_analytics = {
          enabled               = true
          workspace_id          = data.azurerm_log_analytics_workspace.this.workspace_id
          workspace_region      = "centralindia"
          workspace_resource_id = data.azurerm_log_analytics_workspace.this.id
          interval_in_minutes   = 10
        }
      },
      {
        name                      = "nsg-ott007-dev-ci1-aks-0003-flowlog-0001"
        location                  = "centralindia"
        resource_group_name       = "NetworkWatcherRG"
        network_watcher_name      = "NetworkWatcher_centralindia"
        network_security_group_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/networkSecurityGroups/nsg-ott007-dev-ci1-aks-0003"
        storage_account_id        = data.azurerm_storage_account.this.id

        traffic_analytics = {
          enabled               = true
          workspace_id          = data.azurerm_log_analytics_workspace.this.workspace_id
          workspace_region      = "centralindia"
          workspace_resource_id = data.azurerm_log_analytics_workspace.this.id
          interval_in_minutes   = 10
        }
      },
      {
        name                      = "nsg-ott007-dev-ci1-fappint-0004-flowlog-0001"
        location                  = "centralindia"
        resource_group_name       = "NetworkWatcherRG"
        network_watcher_name      = "NetworkWatcher_centralindia"
        network_security_group_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/networkSecurityGroups/nsg-ott007-dev-ci1-fappint-0004"
        storage_account_id        = data.azurerm_storage_account.this.id

        traffic_analytics = {
          enabled               = true
          workspace_id          = data.azurerm_log_analytics_workspace.this.workspace_id
          workspace_region      = "centralindia"
          workspace_resource_id = data.azurerm_log_analytics_workspace.this.id
          interval_in_minutes   = 10
        }
      },
      {
        name                      = "nsg-ott007-dev-ci1-fappint-0005-flowlog-0001"
        location                  = "centralindia"
        resource_group_name       = "NetworkWatcherRG"
        network_watcher_name      = "NetworkWatcher_centralindia"
        network_security_group_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/networkSecurityGroups/nsg-ott007-dev-ci1-fappint-0005"
        storage_account_id        = data.azurerm_storage_account.this.id

        traffic_analytics = {
          enabled               = true
          workspace_id          = data.azurerm_log_analytics_workspace.this.workspace_id
          workspace_region      = "centralindia"
          workspace_resource_id = data.azurerm_log_analytics_workspace.this.id
          interval_in_minutes   = 10
        }
      },
      {
        name                      = "nsg-ott007-dev-ci1-fappint-0006-flowlog-0001"
        location                  = "centralindia"
        resource_group_name       = "NetworkWatcherRG"
        network_watcher_name      = "NetworkWatcher_centralindia"
        network_security_group_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/networkSecurityGroups/nsg-ott007-dev-ci1-fappint-0006"
        storage_account_id        = data.azurerm_storage_account.this.id

        traffic_analytics = {
          enabled               = true
          workspace_id          = data.azurerm_log_analytics_workspace.this.workspace_id
          workspace_region      = "centralindia"
          workspace_resource_id = data.azurerm_log_analytics_workspace.this.id
          interval_in_minutes   = 10
        }
      },
      {
        name                      = "nsg-ott007-dev-ci1-app-0007-flowlog-0001"
        location                  = "centralindia"
        resource_group_name       = "NetworkWatcherRG"
        network_watcher_name      = "NetworkWatcher_centralindia"
        network_security_group_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/networkSecurityGroups/nsg-ott007-dev-ci1-app-0007"
        storage_account_id        = data.azurerm_storage_account.this.id

        traffic_analytics = {
          enabled               = true
          workspace_id          = data.azurerm_log_analytics_workspace.this.workspace_id
          workspace_region      = "centralindia"
          workspace_resource_id = data.azurerm_log_analytics_workspace.this.id
          interval_in_minutes   = 10
        }
      },
      {
        name                      = "nsg-ott007-dev-ci1-data-0008-flowlog-0001"
        location                  = "centralindia"
        resource_group_name       = "NetworkWatcherRG"
        network_watcher_name      = "NetworkWatcher_centralindia"
        network_security_group_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/networkSecurityGroups/nsg-ott007-dev-ci1-data-0008"
        storage_account_id        = data.azurerm_storage_account.this.id

        traffic_analytics = {
          enabled               = true
          workspace_id          = data.azurerm_log_analytics_workspace.this.workspace_id
          workspace_region      = "centralindia"
          workspace_resource_id = data.azurerm_log_analytics_workspace.this.id
          interval_in_minutes   = 10
        }
      },
      {
        name                      = "nsg-ott007-dev-ci1-data-mysql-0009-flowlog-0001"
        location                  = "centralindia"
        resource_group_name       = "NetworkWatcherRG"
        network_watcher_name      = "NetworkWatcher_centralindia"
        network_security_group_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/networkSecurityGroups/nsg-ott007-dev-ci1-data-mysql-0009"
        storage_account_id        = data.azurerm_storage_account.this.id

        traffic_analytics = {
          enabled               = true
          workspace_id          = data.azurerm_log_analytics_workspace.this.workspace_id
          workspace_region      = "centralindia"
          workspace_resource_id = data.azurerm_log_analytics_workspace.this.id
          interval_in_minutes   = 10
        }
      },
      {
        name                      = "nsg-ott007-dev-ci1-data-psql-0010-flowlog-0001"
        location                  = "centralindia"
        resource_group_name       = "NetworkWatcherRG"
        network_watcher_name      = "NetworkWatcher_centralindia"
        network_security_group_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/networkSecurityGroups/nsg-ott007-dev-ci1-data-psql-0010"
        storage_account_id        = data.azurerm_storage_account.this.id

        traffic_analytics = {
          enabled               = true
          workspace_id          = data.azurerm_log_analytics_workspace.this.workspace_id
          workspace_region      = "centralindia"
          workspace_resource_id = data.azurerm_log_analytics_workspace.this.id
          interval_in_minutes   = 10
        }
      },
      {
        name                      = "nsg-ott007-dev-ci1-data-mgsql-0011-flowlog-0001"
        location                  = "centralindia"
        resource_group_name       = "NetworkWatcherRG"
        network_watcher_name      = "NetworkWatcher_centralindia"
        network_security_group_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/networkSecurityGroups/nsg-ott007-dev-ci1-data-mgsql-0011"
        storage_account_id        = data.azurerm_storage_account.this.id

        traffic_analytics = {
          enabled               = true
          workspace_id          = data.azurerm_log_analytics_workspace.this.workspace_id
          workspace_region      = "centralindia"
          workspace_resource_id = data.azurerm_log_analytics_workspace.this.id
          interval_in_minutes   = 10
        }
      }
    ]
  }
}
