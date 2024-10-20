# Using azapi provider to create azurerm_api_management resource 
# as we cannot use azurerm_api_management resource directly due to mssing delete permissions on the SPN.
resource "azapi_resource" "this" {
  type      = "Microsoft.ApiManagement/service@2022-08-01"
  name      = var.settings.name
  location  = var.settings.location
  parent_id = var.settings.resource_group_id
  tags      = var.settings.tags

  identity {
    type         = var.settings.identity_type
    identity_ids = replace(var.settings.identity_type, "UserAssigned", "") == var.settings.identity_type ? null : var.settings.identity_ids
  }

  body = jsonencode({
    properties = {
      additionalLocations = var.settings.properties_additionalLocations
      apiVersionConstraint = {
        minApiVersion = var.settings.properties_apiVersionConstraint_minApiVersion
      }

      customProperties            = var.settings.properties_customProperties
      disableGateway              = var.settings.properties_disableGateway
      enableClientCertificate     = var.settings.properties_enableClientCertificate
      natGatewayState             = var.settings.properties_natGatewayState
      notificationSenderEmail     = var.settings.properties_notificationSenderEmail
      publicIpAddressId           = var.settings.properties_publicIpAddressId
      publicNetworkAccess         = var.settings.properties_publicNetworkAccess
      publisherEmail              = var.settings.properties_publisherEmail
      publisherName               = var.settings.properties_publisherName
      restore                     = var.settings.properties_restore
      virtualNetworkConfiguration = var.settings.properties_virtualNetworkConfiguration
      virtualNetworkType          = var.settings.properties_virtualNetworkType
      platformVersion             = var.settings.properties_platformVersion
      developerPortalStatus       = var.settings.properties_developerPortalStatus
      legacyPortalStatus          = var.settings.properties_legacyPortalStatus
      hostnameConfigurations      = var.settings.properties_hostnameConfigurations
    }
    zones = var.settings.zones

    sku = {
      name     = var.settings.sku.name
      capacity = var.settings.sku.capacity
    }
  })
  schema_validation_enabled = false
  response_export_values    = ["*"]
  timeouts {
    create = "180m"
    update = "180m"
    delete = "180m"
  }

  lifecycle {
    ignore_changes = [body, output]
  }

}

# NOTE: Private endpoint is not supported if Virtual Network type is set to Internal.
resource "azurerm_private_endpoint" "this" {
  count = var.settings.private_ep_subnet_id == null ? 0 : 1

  name                          = var.settings.private_ep_name
  location                      = var.settings.location
  resource_group_name           = var.settings.resource_group_name
  subnet_id                     = var.settings.private_ep_subnet_id
  custom_network_interface_name = replace(var.settings.private_ep_name, "pep-", "pepnic-")
  private_service_connection {
    name                           = "${var.settings.name}-privateserviceconnection"
    private_connection_resource_id = azapi_resource.this.id
    subresource_names              = ["Gateway"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "privatelink.azure-api.net"
    private_dns_zone_ids = var.settings.private_dns_zone_id
  }
}

resource "azurerm_api_management_policy" "this" {
  for_each = var.settings.policy_file_name

  api_management_id = azapi_resource.this.id
  xml_content       = file("${each.key}")
}

resource "azurerm_api_management_certificate" "this" {
  count = var.settings.certificate_name != null ? 1 : 0

  name                = var.settings.certificate_name
  api_management_name = azapi_resource.this.name
  resource_group_name = var.settings.resource_group_name
  key_vault_secret_id = var.settings.key_vault_secret_id
}

resource "azurerm_api_management_logger" "this" {
  name                = "${azapi_resource.this.name}-apimlogger"
  api_management_name = azapi_resource.this.name
  resource_group_name = var.settings.resource_group_name

  application_insights {
    instrumentation_key = var.settings.application_insights.instrumentation_key
  }

  lifecycle {
    ignore_changes = [application_insights]
  }
}

resource "azurerm_api_management_diagnostic" "this" {
  identifier                = "applicationinsights"
  resource_group_name       = var.settings.resource_group_name
  api_management_name       = azapi_resource.this.name
  api_management_logger_id  = azurerm_api_management_logger.this.id
  sampling_percentage       = var.settings.api_management_diagnostic != null ? var.settings.api_management_diagnostic.sampling_percentage : 5.0
  always_log_errors         = true
  log_client_ip             = true
  verbosity                 = "verbose"
  http_correlation_protocol = "W3C"

  frontend_request {
    body_bytes = 32
    headers_to_log = [
      "content-type",
      "accept",
      "origin",
    ]
  }

  frontend_response {
    body_bytes = 32
    headers_to_log = [
      "content-type",
      "content-length",
      "origin",
    ]
  }

  backend_request {
    body_bytes = 32
    headers_to_log = [
      "content-type",
      "accept",
      "origin",
    ]
  }

  backend_response {
    body_bytes = 32
    headers_to_log = [
      "content-type",
      "content-length",
      "origin",
    ]
  }
}

resource "azurerm_api_management_product" "api-product" {
  for_each              = try({ for pr in var.settings.products : pr.product_id => pr }, {})
  product_id            = each.value.product_id
  api_management_name   = var.settings.name
  resource_group_name   = var.settings.resource_group_name
  display_name          = each.value.display_name
  subscription_required = each.value.subscription_required
  approval_required     = each.value.approval_required
  published             = each.value.published
  description           = each.value.description
  depends_on            = [azapi_resource.this]
}

