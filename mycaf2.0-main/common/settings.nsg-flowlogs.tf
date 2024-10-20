locals {
  nsg_names = [
    "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-apim-0001",
    "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-aks-0002",
    "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-aks-0003",
    "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-fappint-0004",
    "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-fappint-0005",
    "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-fappint-0006",
    "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007",
    "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008",
    "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-data-mysql-0009",
    "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-data-psql-0010",
    "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-data-mgsql-0011"
  ]

  configure_nsg_flowlogs_resources = {

    settings = {
      for name in local.nsg_names : "${name}-flowlog-0001" => {
        name                      = "${name}-flowlog-0001"
        location                  = local.common.location
        resource_group_name       = "NetworkWatcherRG"
        network_watcher_name      = "NetworkWatcher_centralindia"
        network_security_group_id = module.nsg[name].id
        storage_account_id        = local.common.hub_storage_account_id

        traffic_analytics = {
          enabled               = true
          workspace_id          = local.common.hub_law_workspaceID
          workspace_region      = local.common.location
          workspace_resource_id = local.common.hub_law_id
          interval_in_minutes   = 10
        }
      }
    }
  }
}
