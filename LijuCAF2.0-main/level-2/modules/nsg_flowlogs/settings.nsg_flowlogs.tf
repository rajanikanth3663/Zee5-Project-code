locals {
  configure_nsg_flowlogs_resources = {
    settings = [
      {
        name                      = "nsg-ott007-np-ci1-ampls-0003-flowlog"
        location                  = "centralindia"
        resource_group_name       = "NetworkWatcherRG"
        network_watcher_name      = "NetworkWatcher_centralindia"
        network_security_group_id = "/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubconnectivity-0001/providers/Microsoft.Network/networkSecurityGroups/nsg-ott007-np-ci1-ampls-0003"
        storage_account_id        = module.log_storage.storage_account_id

        traffic_analytics = {
          enabled               = true
          workspace_id          = data.azurerm_log_analytics_workspace.this.workspace_id
          workspace_region      = "centralindia"
          workspace_resource_id = "/subscriptions/subs-xxxxx-xxxx/resourcegroups/rg-ott007-np-ci1-hubmanagement-0001/providers/microsoft.operationalinsights/workspaces/log-ott007-np-ci1-hub-0001"
          interval_in_minutes   = 10
        }
      },
      {
        name                      = "nsg-ott007-np-ci1-devops-0002-flowlog"
        location                  = "centralindia"
        resource_group_name       = "NetworkWatcherRG"
        network_watcher_name      = "NetworkWatcher_centralindia"
        network_security_group_id = "/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubconnectivity-0001/providers/Microsoft.Network/networkSecurityGroups/nsg-ott007-np-ci1-devops-0002"
        storage_account_id        = module.log_storage.storage_account_id

        traffic_analytics = {
          enabled               = true
          workspace_id          = data.azurerm_log_analytics_workspace.this.workspace_id
          workspace_region      = "centralindia"
          workspace_resource_id = "/subscriptions/subs-xxxxx-xxxx/resourcegroups/rg-ott007-np-ci1-hubmanagement-0001/providers/microsoft.operationalinsights/workspaces/log-ott007-np-ci1-hub-0001"
          interval_in_minutes   = 10
        }
      },
      {
        name                      = "nsg-ott007-np-ci1-devops-0001-flowlog"
        location                  = "centralindia"
        resource_group_name       = "NetworkWatcherRG"
        network_watcher_name      = "NetworkWatcher_centralindia"
        network_security_group_id = "/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubconnectivity-0001/providers/Microsoft.Network/networkSecurityGroups/nsg-ott007-np-ci1-devops-0001"
        storage_account_id        = module.log_storage.storage_account_id

        traffic_analytics = {
          enabled               = true
          workspace_id          = data.azurerm_log_analytics_workspace.this.workspace_id
          workspace_region      = "centralindia"
          workspace_resource_id = "/subscriptions/subs-xxxxx-xxxx/resourcegroups/rg-ott007-np-ci1-hubmanagement-0001/providers/microsoft.operationalinsights/workspaces/log-ott007-np-ci1-hub-0001"
          interval_in_minutes   = 10
        }
      }
    ]
  }
}
