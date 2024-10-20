locals {
  configure_public_ip = {
    settings = {
      "pip-${local.common.bu_name}-${local.common.dep_env}-ci1-medthek-0001" = {
        name                = "pip-${local.common.bu_name}-${local.common.dep_env}-ci1-medthek-0001"
        location            = local.common.location
        resource_group_name = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-medthek-0001"
      }

      "pip-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001" = {
        name                = "pip-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
        location            = local.common.location
        resource_group_name = local.common.resource_group_name_csvc
        domain_name_label   = "apim${local.common.dep_env}"
      }
      mediathekpip1 = {
        name                = "pip-${local.common.bu_name}-${local.common.dep_env}-ci1-medthek--0001"
        location            = local.common.location
        resource_group_name = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-medthek-0001"
      }
    }
  }
}
