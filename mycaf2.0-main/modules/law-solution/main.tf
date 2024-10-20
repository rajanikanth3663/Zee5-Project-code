
resource "azurerm_log_analytics_solution" "this" {
  solution_name         = var.settings.solution_name
  location              = var.settings.location
  resource_group_name   = var.settings.resource_group_name
  workspace_resource_id = var.settings.workspace_resource_id
  workspace_name        = var.settings.workspace_name
  dynamic "plan" {
    for_each = var.settings.plan != null ? var.settings.plan : []
    content {
      publisher = plan.value.publisher
      product   = plan.value.product
    }

  }
}
