<!-- BEGIN_TF_DOCS -->
## Requirements

- Existing Resource Group.
- Existing Virtual Network (if Internal, or Private endpoint is selected).
- Existing Key Vault (if Key Vault is selected).
- Existing Certificate (if Key Vault is selected).

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azapi"></a> [azapi](#provider\_azapi) | n/a |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azapi_resource.this](https://learn.microsoft.com/en-us/azure/templates/microsoft.apimanagement/2022-08-01/service?pivots=deployment-language-terraform) | resource |
| [azurerm_api_management_certificate.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_certificate) | resource |
| [azurerm_api_management_policy.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_policy) | resource |
| [azurerm_private_endpoint.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_settings"></a> [settings](#input\_settings) | n/a | <pre>object({<br>    name              = string<br>    location          = string<br>    resource_group_id = string<br>    tags              = optional(map(string), null)<br>    identity_type     = string<br>    identity_ids      = optional(list(string))<br><br>    properties_additionalLocations = optional(list(object({<br>      disableGateway                               = bool<br>      location                                     = string<br>      natGatewayState                              = string<br>      publicIpAddressId                            = string<br>      sku_capacity                                 = number<br>      sku_name                                     = string<br>      virtualNetworkConfiguration_subnetResourceId = string<br>      zones                                        = optional(list(string))<br>    })))<br><br>    properties_apiVersionConstraint_minApiVersion           = string<br>    properties_customProperties                             = optional(map(string))<br>    properties_disableGateway                               = optional(bool, true)<br>    properties_enableClientCertificate                      = optional(bool, true)<br>    properties_natGatewayState                              = optional(bool, false)<br>    properties_notificationSenderEmail                      = optional(string)<br>    properties_publicIpAddressId                            = optional(string)<br>    properties_publicNetworkAccess                          = optional(bool, "false")<br>    properties_publisherEmail                               = string<br>    properties_publisherName                                = string<br>    properties_restore                                      = optional(bool, false)<br>    properties_virtualNetworkType                           = optional(string, "Internal")<br>    properties_virtualNetworkConfiguration_subnetResourceId = optional(string) # Required if virtualNetworkType is Internal<br><br>    sku = object({<br>      name     = string<br>      capacity = number<br>    })<br>    <br><br>    zones = optional(list(string), null)<br><br>    resource_group_name         = string<br>    policy_file_name            = optional(set(string), [])<br>    key_vault_secret_id         = optional(string)<br>    certificate_name            = optional(string)<br>    private_ep_subnet_id        = optional(string)<br>    private_dns_zone_id         = optional(list(string))<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the API Management Service. |
<!-- END_TF_DOCS -->