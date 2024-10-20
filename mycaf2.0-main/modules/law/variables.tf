variable "settings" {
  description = "azurerm_log_analytics_workspace configuration."
  type = object({
    name                = string
    location            = string
    resource_group_name = string
    sku                 = string
    retention_in_days   = number
    tags                = optional(map(string), null)
  })
}
