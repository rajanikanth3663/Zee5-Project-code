terraform {
  backend "azurerm" {
    container_name = "xx77devspoke-tfstate-0001"
    key            = "xx77digital-dev-shared.tfstate"
  }
}
