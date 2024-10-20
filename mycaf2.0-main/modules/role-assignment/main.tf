resource "azurerm_role_assignment" "role-assignments" {
  scope                = var.settings.scope
  role_definition_name = var.settings.role_definition_name
  principal_id         = var.settings.principal_id
}
