data "azurerm_client_config" "current" {}

module "landingzones" {
  source = "./modules/landingzones"

  providers = {
    azurerm = azurerm
  }

  root_parent_id   = data.azurerm_client_config.current.tenant_id
  root_id          = var.root_id
  primary_location = var.primary_location
}
