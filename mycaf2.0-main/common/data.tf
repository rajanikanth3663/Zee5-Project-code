data "azurerm_client_config" "current" {}
data "azurerm_client_config" "core" {}

data "azurerm_user_assigned_identity" "id_aks_managed" {
  name                = "id-aks-xx77-dev-ci1-csvc-0001"
  resource_group_name = local.common.resource_group_name_csvc
}

data "azurerm_user_assigned_identity" "id_aks_managed_mc" {
  name                = "aks-xx77-dev-ci1-csvc-0001-agentpool"
  resource_group_name = "MC_rg-xx77-dev-ci1-csvc-0001_aks-xx77-dev-ci1-csvc-0001_centralindia"
}

data "azurerm_user_assigned_identity" "id_aks_managed_mc02" {
  name                = "aks-xx77-dev-ci1-csvc-0002-agentpool"
  resource_group_name = "MC_rg-xx77-dev-ci1-csvc-0001_aks-xx77-dev-ci1-csvc-0002_centralindia"
}


data "azurerm_virtual_network" "this" {
  provider            = azurerm.hub
  name                = "vnet-xx77-np-ci1-hub-0001"
  resource_group_name = "rg-xx77-np-ci1-hubconnectivity-0001"
}


data "azurerm_api_management" "this" {
  name                = "apim-xx77-dev-ci1-csvc-0001"
  resource_group_name = local.common.resource_group_name_csvc
}
