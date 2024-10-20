locals {
  configure_acs_resources = {
    settings = {
      "acs-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001" = {
        resource_group_name = local.common.resource_group_name_csvc
        name                = "acs-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
        data_location       = "India"
        monitor_diagnostic_setting = {
          log_analytics_workspace_id = "/subscriptions/${local.hub_subscription_id}/resourceGroups/${local.common.resource_group_name_hubmanagement}/providers/Microsoft.OperationalInsights/workspaces/log-${local.common.bu_name}-np-ci1-hub-0001"
        }
      }
    }
  }
}
