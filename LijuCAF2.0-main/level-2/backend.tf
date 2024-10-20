terraform {
  backend "azurerm" {
    subscription_id = "subs-xxxxx-xxxx"
    container_name  = "stottdetailzztfstatenprod-tfstate-001"
    key             = "ottdetailzz-nprod-level-2.tfstate"
  }
}
