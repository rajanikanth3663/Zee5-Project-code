locals {
  dns_tags = {
    "ApplicationName"    = ""
    "BusinessUnit"       = ""
    "CostCenter"         = ""
    "Description"        = ""
    "DisasterRecovery"   = ""
    "environment"        = ""
    "OwnerName"          = ""
    "RequesterName"      = ""
    "ServiceClass"       = ""
    "ISV"                = ""
    "DataClassification" = ""
  }
  configure_private_dns_zone = {
    settings = {
      adbdns = {
        name                = "azott.in"
        resource_group_name = "rg-ottdetailzz-np-ci1-hubdns-0001"
        tags                = local.dns_tags
      }
    }
  }
}
