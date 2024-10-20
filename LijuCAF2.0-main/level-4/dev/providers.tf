terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.66.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "subs01-xxxxx-xxxx"
  features {}
}

provider "azurerm" {
  alias           = "ott007hubnonprod"
  subscription_id = "subs-xxxxx-xxxx"
  features {}
}