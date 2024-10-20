resource "azurerm_api_management_api" "api" {
  name                  = var.settings.api_name
  resource_group_name   = var.settings.resource_group_name
  api_management_name   = var.settings.api_management_name
  revision              = var.settings.revision
  display_name          = var.settings.display_name
  protocols             = var.settings.protocols
  service_url           = var.settings.service_url
  path                  = var.settings.path
  subscription_required = var.settings.subscription_required

  subscription_key_parameter_names {
    header = "Ocp-Apim-Subscription"
    query  = "subscription-key"
  }
}
resource "azurerm_api_management_api_operation" "api-endpoint" {
  for_each            = { for ep in var.settings.endpoints : ep.endpoint_name => ep }
  operation_id        = each.value.endpoint_name
  api_name            = var.settings.api_name
  api_management_name = var.settings.api_management_name
  resource_group_name = var.settings.resource_group_name
  display_name        = each.value.display_name
  method              = each.value.method
  url_template        = each.value.url_template

  dynamic "template_parameter" {
    for_each = each.value.template_parameter != null ? each.value.template_parameter : []
    content {
      name     = template_parameter.value.name
      type     = template_parameter.value.type
      required = template_parameter.value.required
    }
  }
  request {
    dynamic "query_parameter" {
      for_each = each.value.query_parameter != null ? each.value.query_parameter : []
      content {
        name     = query_parameter.value.name
        type     = query_parameter.value.type
        required = query_parameter.value.required
      }
    }
  }
  dynamic "response" {
    for_each = each.value.response != null ? each.value.response : []
    content {
      status_code = response.value.status_code
      dynamic "representation" {
        for_each = response.value.representation != null ? response.value.representation : []
        content {
          content_type = representation.value.content_type
          dynamic "example" {
            for_each = representation.value.example != null ? representation.value.example : []
            content {
              name = example.value.name
              # value = jsonencode(example.value.examplevalue.objectvalues)
              # value = jsonencode(lookup(merge(example.value.stringvalue, example.value.listvalue)), null)

              value = jsonencode(merge(
                example.value.stringvalue != null ? example.value.stringvalue : {},
                example.value.listvalue != null ? example.value.listvalue : {}
              ))
            }
          }
        }
      }
    }
  }
  depends_on = [azurerm_api_management_api.api]
}

resource "azurerm_api_management_api_operation_policy" "this" {
  for_each            = try({ for c in var.settings.api_operation_policy : c.api_name => c }, {})
  api_name            = each.key
  api_management_name = var.settings.api_management_name
  resource_group_name = var.settings.resource_group_name
  operation_id        = each.value.operation_id
  xml_content         = each.value.xml_content
}

resource "azurerm_api_management_api_policy" "this" {
  for_each            = try({ for c in var.settings.api_policy : c.api_name => c }, {})
  api_name            = each.key
  api_management_name = var.settings.api_management_name
  resource_group_name = var.settings.resource_group_name
  xml_content         = each.value.xml_content
}

resource "azurerm_api_management_product_api" "api-product" {
  for_each            = try({ for pr in var.settings.product : pr.product_id => pr }, {})
  api_name            = var.settings.api_name
  product_id          = each.value.product_id
  api_management_name = var.settings.api_management_name
  resource_group_name = var.settings.resource_group_name
  depends_on          = [azurerm_api_management_api.api]
}

