locals {
  tenant_id = "56bd48cd-f312-49e8-b6c7-7b5b926c03d6"
}

resource "azurerm_resource_group" "this" {
  name     = local.configure_aks_resources.settings.resource_group_name
  location = local.configure_aks_resources.settings.location
}

module "aks" {
  source     = "../../../modules/aks"
  settings   = local.configure_aks_resources.settings
  depends_on = [azurerm_resource_group.this]
}

module "aksuat" {
  source     = "../../../modules/aks"
  settings   = local.configure_aksuat_resources.settings
  depends_on = [azurerm_resource_group.this]
}

module "key_vault" {
  source     = "../../../modules/key-vault"
  settings   = local.configure_keyvault_resources.settings
  depends_on = [azurerm_resource_group.this]
}
