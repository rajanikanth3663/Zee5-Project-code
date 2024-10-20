module "spoke_vnet" {
  source = "./modules/spoke-vnet"
}

module "cms" {
  source     = "./modules/csss"
  vnet_id    = module.spoke_vnet.id
  depends_on = [module.spoke_vnet, module.cmsapp, module.video-engineering]
}

module "medthek" {
  source     = "./modules/medthek"
  depends_on = [module.spoke_vnet]
}

module "video-engineering" {
  source     = "./modules/video-engineering"
  depends_on = [module.spoke_vnet]
}

module "adtservice" {
  source            = "./modules/adtservice"
  vm_admin_password = var.vm_admin_password
  depends_on        = [module.spoke_vnet]
}

module "cmsapp" {
  source     = "./modules/cmsapp"
  depends_on = [module.spoke_vnet]
}
