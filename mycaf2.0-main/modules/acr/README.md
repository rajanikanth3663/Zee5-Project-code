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
| [azurerm_container_registry.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_settings"></a> [settings](#input\_settings) | configure acr resources | <pre>object({<br>    location                   = string<br>    resource_group_name        = string<br>    name                       = string<br>    sku                        = optional(string, "Premium")<br>    admin_enabled              = optional(bool, false)<br>    zone_redundancy_enabled    = optional(bool, true)<br>    network_rule_bypass_option = optional(bool, true)<br>    data_endpoint_enabled      = bool<br><br>    retention_policy = optional(object({<br>      enabled = optional(bool, false)<br>      days    = optional(number, 7)<br>    }), {})<br><br>    trust_policy = optional(bool, true)<br><br>    georeplications = optional(list(object({<br>      location                  = string<br>      zone_redundancy_enabled   = bool<br>      regional_endpoint_enabled = bool<br>    })), [])<br><br>    network_rule_set = optional(object({<br>      default_action = optional(string)<br>      ip_range       = optional(list(string), [])<br>      subnet_id      = optional(list(string), [])<br>    }), {})<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_acr_fqdn"></a> [acr\_fqdn](#output\_acr\_fqdn) | The Container Registry FQDN. |
| <a name="output_acr_id"></a> [acr\_id](#output\_acr\_id) | The Container Registry ID. |
| <a name="output_acr_name"></a> [acr\_name](#output\_acr\_name) | The Container Registry name. |
| <a name="output_admin_password"></a> [admin\_password](#output\_admin\_password) | The Password associated with the Container Registry Admin account - if the admin account is enabled. |
| <a name="output_admin_username"></a> [admin\_username](#output\_admin\_username) | The Username associated with the Container Registry Admin account - if the admin account is enabled. |
| <a name="output_login_server"></a> [login\_server](#output\_login\_server) | The URL that can be used to log into the container registry. |
<!-- END_TF_DOCS -->