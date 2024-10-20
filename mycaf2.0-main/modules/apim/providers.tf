# azapi provider required for azurerm_api_management
terraform {
  required_providers {
    azapi = {
      source = "azure/azapi"
    }
  }
}