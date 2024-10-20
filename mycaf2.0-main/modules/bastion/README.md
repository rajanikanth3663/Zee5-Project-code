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
| [azurerm_bastion_host.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/bastion_host) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_settings"></a> [settings](#input\_settings) | n/a | <pre>object({<br>    name                   = string<br>    location               = string<br>    resource_group_name    = string<br>    copy_paste_enabled     = optional(bool, true)<br>    file_copy_enabled      = optional(bool, false)<br>    sku                    = optional(string, "Standard")<br>    ip_connect_enabled     = optional(bool, false)<br>    scale_units            = optional(number, 2)<br>    shareable_link_enabled = optional(bool, false)<br>    tunneling_enabled      = optional(bool, false)<br><br>    ip_configuration = object({<br>      name                 = optional(string, "configuration")<br>      subnet_id            = string<br>      public_ip_address_id = string<br>    })<br>    tags = optional(map(string), null)<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns_name"></a> [dns\_name](#output\_dns\_name) | The FQDN for the Bastion Host. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the Bastion Host. |
<!-- END_TF_DOCS -->