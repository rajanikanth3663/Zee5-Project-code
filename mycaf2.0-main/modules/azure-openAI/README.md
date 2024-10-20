<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_cognitive_account.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cognitive_account) | resource |
| [azurerm_private_endpoint.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_settings"></a> [settings](#input\_settings) | n/a | <pre>object({<br>    name                = string<br>    location            = string<br>    resource_group_name = string<br>    sku                 = optional(string, "S1")<br>    tags                = optional(map(string), null)<br><br>    private_endpoint_enabled = optional(bool, true)<br><br>    private_endpoint = optional(object({<br>      endpoint_name        = optional(string)<br>      subnet_id            = optional(string)<br>      connection_name      = optional(string)<br>      private_dns_zone_ids = optional(list(string))<br>    }))<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | The endpoint used to connect to the Cognitive Service Account. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the Cognitive Service Account. |
| <a name="output_primary_access_key"></a> [primary\_access\_key](#output\_primary\_access\_key) | A primary access key which can be used to connect to the Cognitive Service Account. |
| <a name="output_secondary_access_key"></a> [secondary\_access\_key](#output\_secondary\_access\_key) | The secondary access key which can be used to connect to the Cognitive Service Account. |
<!-- END_TF_DOCS -->