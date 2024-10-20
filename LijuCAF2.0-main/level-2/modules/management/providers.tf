terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.66.0"
    }

    azapi = {
      source  = "Azure/azapi"
      version = "1.10.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azapi" {
}
