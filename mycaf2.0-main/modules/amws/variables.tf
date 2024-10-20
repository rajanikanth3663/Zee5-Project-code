variable "settings" {
  description = "azurerm_monitor_workspace configuration."
  type = object({
    name                = string
    resource_group_name = string
    location            = string

  })
}
