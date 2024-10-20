resource "azurerm_app_configuration_key" "appconfigkey" {
  configuration_store_id = var.settings.configuration_store_id
  key                    = var.settings.key
  label                  = var.settings.label
  value                  = var.settings.value
  type                   = var.settings.type
  vault_key_reference    = var.settings.vault_key_reference

  lifecycle {
    ignore_changes = [
      value
    ]
  }
}
