module "argocd" {
  source = "./modules/argocd-infra"
}

module "runner" {
  source     = "./modules/runner-infra"
  depends_on = [module.argocd]
}