resource "azapi_resource" "bingSearchAccount" {
  type                      = "Microsoft.Bing/accounts@2020-06-10"
  schema_validation_enabled = false
  name                      = var.settings.name
  parent_id                 = var.settings.resource_group_id
  location                  = var.settings.location
  body = jsonencode({
    sku = {
      name = var.settings.sku
    }
    kind = "Bing.Search.v7"
    tags = var.settings.tags
  })
  response_export_values = ["*"]
}
