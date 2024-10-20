locals {
  subscription_id = "subs01-xxxxx-xxxx"
  tenant_id       = "56bd48cd-f312-49e8-b6c7-7b5b926c03d6"
}

data "azurerm_client_config" "current" {}
data "azurerm_client_config" "core" {}
data "azurerm_virtual_network" "this" {
  provider            = azurerm.hub
  name                = "vnet-ott007-np-ci1-hub-0001"
  resource_group_name = "rg-ott007-np-ci1-hubconnectivity-0001"
}

data "azurerm_log_analytics_workspace" "this" {
  provider            = azurerm.hub
  name                = "log-ott007-np-ci1-hub-0001"
  resource_group_name = "rg-ott007-np-ci1-hubmanagement-0001"
}

data "azurerm_storage_account" "this" {
  provider            = azurerm.hub
  name                = "stott007npci1hub0001"
  resource_group_name = "rg-ott007-np-ci1-hubconnectivity-0001"
}

resource "azurerm_resource_group" "this" {
  name     = local.configure_resourcegroup_resources.settings.name
  location = local.configure_resourcegroup_resources.settings.location
  tags     = local.configure_resourcegroup_resources.settings.tags
}

resource "azurerm_resource_group" "csss2" {
  name     = local.configure_resourcegroup_resources_csss2.settings.name
  location = local.configure_resourcegroup_resources_csss2.settings.location
  tags     = local.configure_resourcegroup_resources_csss2.settings.tags
}

resource "azurerm_resource_group" "medthek" {
  name     = local.configure_medthek_resourcegroup_resources.settings.name
  location = local.configure_medthek_resourcegroup_resources.settings.location
  tags     = local.configure_medthek_resourcegroup_resources.settings.tags
}

resource "azurerm_resource_group" "atemeapp" {
  name     = local.configure_atemeapp_resourcegroup_resources.settings.name
  location = local.configure_atemeapp_resourcegroup_resources.settings.location
  tags     = local.configure_atemeapp_resourcegroup_resources.settings.tags
}

resource "azurerm_resource_group" "atemevnet" {
  name     = local.configure_atemevnet_resourcegroup_resources.settings.name
  location = local.configure_atemevnet_resourcegroup_resources.settings.location
  tags     = local.configure_atemevnet_resourcegroup_resources.settings.tags
}

resource "azurerm_resource_group" "ve" {
  name     = local.configure_ve_resourcegroup_resources.settings.name
  location = local.configure_ve_resourcegroup_resources.settings.location
  tags     = local.configure_ve_resourcegroup_resources.settings.tags
}

resource "azurerm_resource_group" "cms" {
  name     = local.configure_cms_resourcegroup_resources.settings.name
  location = local.configure_cms_resourcegroup_resources.settings.location
  tags     = local.configure_cms_resourcegroup_resources.settings.tags
}

resource "azurerm_resource_group" "adthek" {
  name     = local.configure_adtservice_resourcegroup_resources.settings.name
  location = local.configure_adtservice_resourcegroup_resources.settings.location
  tags     = local.configure_adtservice_resourcegroup_resources.settings.tags
}

module "vnet" {
  count      = length(local.vnet_configurations.settings)
  source     = "../../../../modules/vnet"
  settings   = element(local.vnet_configurations.settings, count.index)
  depends_on = [azurerm_resource_group.this]
}

module "nsg" {
  count      = length(local.configure_nsg_resources.settings)
  source     = "../../../../modules/nsg"
  settings   = element(local.configure_nsg_resources.settings, count.index)
  depends_on = [module.vnet]
}

module "vnet-peering-spoketohub" {
  source     = "../../../../modules/vnet-peering"
  settings   = local.vnet_peer_configurations.settings.spoketohub
  depends_on = [module.vnet]
}

module "vnet-peering-hubtospoke" {
  source     = "../../../../modules/vnet-peering"
  settings   = local.vnet_peer_configurations.settings.hubtospoke
  depends_on = [module.vnet]

  providers = {
    azurerm = azurerm.hub
  }
}

module "vnet-peering-medthektohub" {
  source     = "../../../../modules/vnet-peering"
  settings   = local.vnet_peer_configurations.settings.medthektohub
  depends_on = [module.vnet]
}

module "vnet-peering-hubtomedthek" {
  source     = "../../../../modules/vnet-peering"
  settings   = local.vnet_peer_configurations.settings.hubtomedthek
  depends_on = [module.vnet]

  providers = {
    azurerm = azurerm.hub
  }
}
module "network_flow" {
  count      = length(local.configure_nsg_flowlogs_resources.settings)
  source     = "../../../../modules/network-flow"
  settings   = element(local.configure_nsg_flowlogs_resources.settings, count.index)
  depends_on = [module.nsg]
}
module "udr" {
  for_each   = local.configure_udr_resources.settings
  source     = "../../../../modules/routetable"
  settings   = each.value
  depends_on = [module.vnet]
}
module "law" {
  for_each = local.configure_law_resources.settings
  source   = "../../../../modules/law"
  settings = each.value
}
