data "azurerm_client_config" "core" {}

locals {
  tenant_id = "56bd48cd-f312-49e8-b6c7-7b5b926c03d6"
}

data "azurerm_storage_account" "this" {
  name                = "stott007devci1ve0001"
  resource_group_name = "rg-ott007-dev-ci1-ve-0001"
}

module "servicebus" {
  for_each = local.configure_servicebus_resources.settings
  source   = "../../../../modules/servicebus"
  settings = each.value
}

module "asp" {
  for_each = local.configure_asp_resources.settings
  source   = "../../../../modules/asp"
  settings = each.value
}

module "ai" {
  for_each = local.configure_ai_resources.settings
  source   = "../../../../modules/ai"
  settings = each.value
}

module "uai" {
  for_each = local.configure_uai_resources.settings
  source   = "../../../../modules/user-assigned-identity"
  settings = each.value
}
module "event-grid-st" {
  for_each   = local.configure_eventgrid_st_resources.settings
  source     = "../../../../modules/event-grid-st"
  settings   = each.value
  depends_on = [module.servicebus]
}

module "storage" {
  for_each = local.configure_storage_resources.settings
  source   = "../../../../modules/storage-account"
  settings = each.value
}

module "key_vault" {
  source   = "../../../../modules/key-vault"
  for_each = local.configure_keyvault_resources.settings
  settings = each.value
}

module "function_app" {
  source     = "../../../../modules/function-app-linux"
  for_each   = local.configure_function_app_resources.settings
  settings   = each.value
  depends_on = [module.storage, module.asp]
}
module "vm_linux_customimage" {
  for_each = local.configure_vm_linux_customimage.settings
  source   = "../../../../modules/vm-linux-customimage"
  settings = each.value
}
