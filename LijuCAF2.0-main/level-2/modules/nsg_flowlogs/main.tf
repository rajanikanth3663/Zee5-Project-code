data "azurerm_client_config" "core" {}

data "azurerm_log_analytics_workspace" "this" {
  name                = "log-ott007-np-ci1-hub-0001"
  resource_group_name = "rg-ott007-np-ci1-hubmanagement-0001"
}

module "log_storage" {
  source   = "../../../modules/storage-account"
  settings = local.configure_storage_resources.settings
}

module "network_flow" {
  count    = length(local.configure_nsg_flowlogs_resources.settings)
  source   = "../../../modules/network-flow"
  settings = element(local.configure_nsg_flowlogs_resources.settings, count.index)
}