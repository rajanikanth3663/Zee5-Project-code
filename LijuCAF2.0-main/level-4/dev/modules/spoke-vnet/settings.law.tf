locals {
  configure_law_resources = {
    settings = {

      log-ott007-dev-ci1-0001 = {
        resource_group_name = "rg-ott007-dev-ci1-csss-0001"
        name                = "log-ott007-dev-ci1-0001"
        location            = "centralindia"
        sku                 = "PerGB2018"
        retention_in_days   = 30
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
}
