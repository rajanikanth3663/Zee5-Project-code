terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.92.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "subs-******-******"
  features {}
}

provider "azurerm" {
  alias           = "hub"
  subscription_id = "subs-******-*****"
  features {}
}

provider "azurerm" {
  alias           = "datadev"
  subscription_id = "sub4-*****"
  features {}
}
