module "resource-groups" {
  for_each = local.configure_resource_groups.settings
  source   = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//resource-group?ref=dev"
  settings = each.value
}

module "vnet" {
  for_each   = local.configure_vnet_resources.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//vnet?ref=dev"
  settings   = each.value
  depends_on = [module.resource-groups]
}

module "vnet-peering-spoketohub" {
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//vnet-peering?ref=dev"
  settings   = local.vnet_peer_configurations.settings.spoketohub
  depends_on = [module.vnet]
}

module "vnet-peering-hubtospoke" {
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//vnet-peering?ref=dev"
  settings   = local.vnet_peer_configurations.settings.hubtospoke
  depends_on = [module.vnet]

  providers = {
    azurerm = azurerm.hub
  }
}

module "vnet-peering-medthektohub" {
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//vnet-peering?ref=dev"
  settings   = local.vnet_peer_configurations.settings.medthektohub
  depends_on = [module.vnet]
}

module "vnet-peering-hubtomedthek" {
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//vnet-peering?ref=dev"
  settings   = local.vnet_peer_configurations.settings.hubtomedthek
  depends_on = [module.vnet]

  providers = {
    azurerm = azurerm.hub
  }
}
module "vnet-peering-hubtoatemedev" {
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//vnet-peering?ref=dev"
  settings   = local.vnet_peer_configurations.settings.hubtoatemedev
  depends_on = [module.vnet]

  providers = {
    azurerm = azurerm.hub
  }
}

module "vnet-peering-atemedevtohub" {
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//vnet-peering?ref=dev"
  settings   = local.vnet_peer_configurations.settings.atemedevtohub
  depends_on = [module.vnet]
}

module "vnet-peering-atemedevtocsvc" {
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//vnet-peering?ref=dev"
  settings   = local.vnet_peer_configurations.settings.atemedevtocsvc
  depends_on = [module.vnet]
}

module "vnet-peering-csvctoatemedev" {
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//vnet-peering?ref=dev"
  settings   = local.vnet_peer_configurations.settings.csvctoatemedev
  depends_on = [module.vnet]
}

module "nsg" {
  for_each   = local.configure_nsg_resources.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//nsg?ref=dev"
  settings   = each.value
  depends_on = [module.vnet]
}

module "nsg-flowlog" {
  for_each   = local.configure_nsg_flowlogs_resources.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//network-flow?ref=dev"
  settings   = each.value
  depends_on = [module.nsg]
}

module "law" {
  for_each   = local.configure_law_resources.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//law?ref=dev"
  settings   = each.value
  depends_on = [module.resource-groups]
}
module "ai" {
  for_each   = local.configure_ai_resources.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//ai?ref=dev"
  settings   = each.value
  depends_on = [module.law]
}

module "storage-account" {
  for_each   = local.configure_storage_account_resources.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//storage-account?ref=dev"
  settings   = each.value
  depends_on = [module.resource-groups, module.vnet]
}

module "cosmosdb-cassandra" {
  for_each   = local.configure_cosmosdb_cassandra_resources.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//cosmosdb?ref=dev"
  settings   = each.value
  depends_on = [module.vnet]
}

module "cosmosdb-mongo" {
  for_each   = local.configure_cosmosdb_mongodb_resources.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//cosmosdb?ref=dev"
  settings   = each.value
  depends_on = [module.vnet]
}

module "keyvault" {
  for_each   = local.configure_keyvault_resources.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//key-vault?ref=dev"
  settings   = each.value
  depends_on = [module.vnet]
}

module "apim" {
  for_each   = local.configure_apim_resources.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//apim?ref=dev"
  settings   = each.value
  depends_on = [module.vnet, module.ai]
}

module "rediscache" {
  for_each   = local.configure_rediscache_resources.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//rediscache?ref=dev"
  settings   = each.value
  depends_on = [module.vnet]
}

module "redisen" {
  for_each   = local.configure_redisen_resources.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//redis-en?ref=dev"
  settings   = each.value
  depends_on = [module.vnet]
}

module "aks" {
  for_each   = local.configure_aks_resources.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//aks?ref=dev"
  settings   = each.value
  depends_on = [module.vnet]
}

module "udr" {
  for_each   = local.configure_udr_resources.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//routetable?ref=dev"
  settings   = each.value
  depends_on = [module.vnet]
}

module "amdce" {
  for_each   = local.configure_amdce_resources.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//amdce?ref=dev"
  settings   = each.value
  depends_on = [module.resource-groups]
}
module "amplss" {
  for_each = local.configure_amplss_resources.settings
  source   = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//amplss?ref=dev"
  settings = each.value
  providers = {
    azurerm = azurerm.hub
  }
  depends_on = [module.resource-groups]
}

module "amdcra" {
  for_each   = local.configure_amdcra_resources.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//amdcra?ref=dev"
  settings   = each.value
  depends_on = [module.resource-groups]
}
module "amws" {
  for_each   = local.configure_amws_resources.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//amws?ref=dev"
  settings   = each.value
  depends_on = [module.resource-groups]
}

module "asp" {
  for_each   = local.configure_asp_resources.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//asp?ref=dev"
  settings   = each.value
  depends_on = [module.resource-groups]
}

resource "azurerm_marketplace_agreement" "solr" {
  publisher = "canonical"
  offer     = "0001-com-ubuntu-pro-bionic"
  plan      = "pro-18_04-lts-gen2"
}


module "diagnostic-setting" {
  for_each   = local.configure_diagnostic_setting_resources.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//diagnostic-setting?ref=dev"
  settings   = each.value
  depends_on = [module.resource-groups]
}

module "appconfig" {
  for_each   = local.configure_appconfig_resources.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//appconfig?ref=dev"
  settings   = each.value
  depends_on = [module.vnet]
}

module "acr" {
  for_each   = local.configure_acr_resources.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//acr?ref=dev"
  settings   = each.value
  depends_on = [module.resource-groups]
}

module "eventhub-dedicated" {
  for_each   = local.configure_eventhub_dedicated_resources.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//eventhub-dedicated?ref=dev"
  settings   = each.value
  depends_on = [module.resource-groups]
}

module "mysql-flexible" {
  for_each   = local.configure_mysql_resources.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//mysql-flexible?ref=dev"
  settings   = each.value
  depends_on = [module.resource-groups]
}

module "postgres-flexible" {
  for_each   = local.configure_postgres_resources.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//postgresql?ref=dev"
  settings   = each.value
  depends_on = [module.resource-groups]
}

module "mssql" {
  for_each   = local.configure_mssql_resources.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//mssql?ref=dev"
  settings   = each.value
  depends_on = [module.resource-groups]
}

module "rsv" {
  for_each   = local.configure_rsv_resources.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//rsv?ref=dev"
  settings   = each.value
  depends_on = [module.aks]
}

module "vm-linux-customimage" {
  for_each   = local.configure_vm_linux_customimage_resources.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//vm-linux-customimage?ref=dev"
  settings   = each.value
  depends_on = [module.resource-groups]
}


module "solrvm-ss" {
  for_each   = local.configure_vm_linuxss_customimage.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//vmss-linux?ref=dev"
  settings   = each.value
  depends_on = [module.resource-groups]
}

module "function_app" {
  source   = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//function-app-linux?ref=dev"
  for_each = local.configure_function_app_resources.settings
  settings = each.value
  # depends_on = [module.storage-account, module.asp]
}

module "uai" {
  for_each = local.configure_uai_resources.settings
  source   = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//user-assigned-identity?ref=dev"
  settings = each.value
  # depends_on = [module.resource-groups,module.function_app]
}

module "servicebus" {
  for_each   = local.configure_servicebus_resources.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//servicebus?ref=dev"
  settings   = each.value
  depends_on = [module.resource-groups]
}

module "event-grid-st" {
  for_each   = local.configure_eventgrid_st_resources.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//event-grid-st?ref=dev"
  settings   = each.value
  depends_on = [module.resource-groups]
}

module "stream-analytics-cluster" {
  for_each   = local.configure_streamanalytics.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//streamanalytics?ref=dev"
  settings   = each.value
  depends_on = [module.resource-groups]
}

module "eventhub-ns" {
  for_each   = local.configure_eventhub_ns_resources.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//event-hub?ref=dev"
  settings   = each.value
  depends_on = [module.resource-groups]
}


module "public-ip" {
  for_each   = local.configure_public_ip.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//public-ip?ref=dev"
  settings   = each.value
  depends_on = [module.resource-groups]
}

module "lb" {
  for_each   = local.configure_lb_resources.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//lb?ref=dev"
  settings   = each.value
  depends_on = [module.resource-groups]
}

module "acs" {
  for_each   = local.configure_acs_resources.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//acs?ref=dev"
  settings   = each.value
  depends_on = [module.resource-groups]
}

module "vm_linux_customimagev3" {
  for_each   = local.configure_vm_linux_customimagev3.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//vm-linux-customimagev3?ref=dev"
  settings   = each.value
  depends_on = [module.resource-groups]
}

module "configure_streamanalytic_job" {
  for_each   = local.configure_streamanalytic_job.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//streamanalytics-jobs?ref=dev"
  settings   = each.value
  depends_on = [module.stream-analytics-cluster]
}

module "role-assignment" {
  for_each   = local.configure_role_assignments.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//role-assignment?ref=dev"
  settings   = each.value
  depends_on = [module.aks, module.keyvault, module.appconfig]
}

module "frontdoor-configuration" {
  providers = {
    azurerm = azurerm.hub
  }
  for_each   = local.configure_frontdoor_configurations_resources.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//frontdoor-configuration?ref=dev"
  settings   = each.value
  depends_on = [module.resource-groups]
}

module "event-grid-kv" {
  for_each   = local.configure_eventgrid_kv_resources.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//event-grid-st?ref=dev"
  settings   = each.value
  depends_on = [module.resource-groups]
}

module "kv-key-rotation" {
  for_each   = local.configure_keyvault_keyrotation.settings
  source     = "git::git@github.com:xx77-5/azure-xx77digital-tf-modules.git//keyvault-key-rotation?ref=dev"
  settings   = each.value
  depends_on = [module.keyvault]

}