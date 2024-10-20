data "azurerm_client_config" "current" {}

module "management" {
  source           = "./modules/management"
  root_id          = var.root_id
  root_name        = var.root_name
  primary_location = var.primary_location
}

module "connectivity" {
  source           = "./modules/connectivity"
  root_id          = var.root_id
  root_name        = var.root_name
  primary_location = var.primary_location
}

module "customdnszones" {
  source = "./modules/customdnszones"
}

module "frontdoor" {
  source     = "../modules/frontdoor"
  settings   = local.configure_frontdoor_resources.settings
  depends_on = [module.connectivity]
}

module "frontdoor_adtservice" {
  source     = "../modules/frontdoor"
  settings   = local.configure_frontdoor_adtservice_resources.settings
  depends_on = [module.connectivity]
}

module "nsg_flowlogs" {
  source     = "./modules/nsg_flowlogs"
  depends_on = [module.management, module.connectivity]
}

module "public_dns" {
  source = "./modules/publicdns"
}


