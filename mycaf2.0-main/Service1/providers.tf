terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.85.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "951bb481-cd31-4ad0-add8-6914f12d4849"
}
