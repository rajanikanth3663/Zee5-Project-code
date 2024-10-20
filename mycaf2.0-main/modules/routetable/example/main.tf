module "udr" {
  source     = "./module"
  settings   = local.configure_udr_resources.settings
  depends_on = [data.azurerm_resource_group.rg]

}