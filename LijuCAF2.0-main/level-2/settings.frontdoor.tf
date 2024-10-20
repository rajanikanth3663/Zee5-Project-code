locals {
  configure_frontdoor_resources = {
    settings = {
      profile = {
        name                = "afd-ott007-np-hub-0001"
        resource_group_name = "rg-ott007-np-ci1-hubconnectivity-0001"
        sku_name            = "Premium_AzureFrontDoor"
      }
      endpoint = {
        name    = "ott007np-endpoint"
        enabled = true
      }
      firewall = {
        name                = "wafott007npci1afd0001"
        resource_group_name = "rg-ott007-np-ci1-hubconnectivity-0001"
        location            = "centralindia"
        mode                = "Prevention"
        enabled             = true
        custom_rule         = []
      }
      tags = {
        "service-name"       = ""
        "BusinessUnit"       = ""
        "CostCenter"         = ""
        "DisasterRecovery"   = ""
        "environment"        = ""
        "OwnerName"          = ""
        "servicecriticality" = ""
        "ISV"                = ""
        "DataClassification" = ""
        "service-family"     = ""
        "ticket-id"          = ""
        "lead-spoc"          = ""
        "created_by"         = ""
        "Created_Date"       = ""
        "Updated_Date"       = ""
      }
    }
  }
}
