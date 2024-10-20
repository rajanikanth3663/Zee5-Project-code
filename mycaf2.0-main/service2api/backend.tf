terraform {
  backend "azurerm" {
    container_name = "zee5uatspoke-tfstate-0001"
    key            = "zeedigital-uat-cms-bulk-operations.tfstate"
  }
}
