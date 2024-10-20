terraform {
  backend "azurerm" {
    container_name = "stottdetailzztfstatenprod-tfstate-001"
    key            = "ottdetailzz-dev-level-4.tfstate"
  }
}
