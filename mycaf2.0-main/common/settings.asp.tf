locals {
  configure_asp_resources = {
    settings = {

      "asp-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001" = {
        resource_group_name = local.common.resource_group_name_csvc
        name                = "asp-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
        location            = local.common.location
        os_type             = "Linux"
        sku_name            = "P2v3"
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

      "asp-${local.common.bu_name}-${local.common.dep_env}-ci1-cms-0001" = {
        resource_group_name = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-cms-0001"
        name                = "asp-${local.common.bu_name}-${local.common.dep_env}-ci1-cms-0001"
        location            = local.common.location
        os_type             = "Linux"
        sku_name            = "P2v3"
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

      "asp-${local.common.bu_name}-${local.common.dep_env}-ci1-ve-0001" = {
        resource_group_name = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-ve-0001"
        name                = "asp-${local.common.bu_name}-${local.common.dep_env}-ci1-ve-0001"
        location            = local.common.location
        os_type             = "Linux"
        sku_name            = "P2v3"
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

      "asp-${local.common.bu_name}-${local.common.dep_env}-ci1-ve-0002" = {
        resource_group_name = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-ve-0001"
        name                = "asp-${local.common.bu_name}-${local.common.dep_env}-ci1-ve-0002"
        location            = local.common.location
        os_type             = "Linux"
        sku_name            = "P2v3"
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
