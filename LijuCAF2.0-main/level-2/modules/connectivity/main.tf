data "azurerm_client_config" "core" {}

locals {
  subscription_id = "subs-xxxxx-xxxx"
  tenant_id       = "56bd48cd-f312-49e8-b6c7-7b5b926c03d6"
}

module "caf_level2" {
  source           = "Azure/caf-enterprise-scale/azurerm"
  version          = "~>4.2.0"
  default_location = var.primary_location

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm
    azurerm.management   = azurerm
  }

  root_parent_id                   = data.azurerm_client_config.core.tenant_id
  root_id                          = var.root_id
  deploy_core_landing_zones        = false
  deploy_connectivity_resources    = true
  subscription_id_connectivity     = data.azurerm_client_config.core.subscription_id
  configure_connectivity_resources = local.configure_connectivity_resources
}

module "firewall_ip" {
  source     = "../../../modules/public-ip"
  settings   = local.firewall_ip.settings
  depends_on = [module.caf_level2.azurerm_resource_group]
}

module "firewall_management_ip" {
  source     = "../../../modules/public-ip"
  settings   = local.firewall_management_ip.settings
  depends_on = [module.caf_level2.azurerm_resource_group]
}

module "nsg" {
  count      = length(local.configure_nsg_resources.settings)
  settings   = element(local.configure_nsg_resources.settings, count.index)
  source     = "../../../modules/nsg"
  depends_on = [module.caf_level2]
}

module "fwrules" {
  for_each   = local.configure_fwrules.settings
  source     = "../../../modules/fwrules"
  settings   = each.value
  depends_on = [module.caf_level2]
}

module "udr" {
  for_each   = local.configure_udr_resources.settings
  source     = "../../../modules/routetable"
  settings   = each.value
  depends_on = [module.caf_level2]
}