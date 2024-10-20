terraform {
  backend "azurerm" {
    container_name = "stottdetailzztfstatenprod-tfstate-001"
    key            = "ottdetailzz-nprod-level-1.tfstate"
  }
}
