locals {
  configure_uai_resources = {
    settings = {

      "id-${local.common.bu_name}-${local.common.dep_env}-ci1-cms-0001" = {
        resource_group_name = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-cms-0001"
        name                = "id-${local.common.bu_name}-${local.common.dep_env}-ci1-cms-0001"
        location            = local.common.location
      }

      "id-${local.common.bu_name}-${local.common.dep_env}-ci1-cms-0002" = {
        resource_group_name = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-cms-0001"
        name                = "id-${local.common.bu_name}-${local.common.dep_env}-ci1-cms-0002"
        location            = local.common.location
      }

      "id-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcfa-0001" = {
        resource_group_name = local.common.resource_group_name_csvc
        name                = "id-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcfa-0001"
        location            = local.common.location
      }
      "id-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-0001" = {
        resource_group_name = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-0001"
        name                = "id-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-0001"
        location            = local.common.location
      }

      "id-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-0002" = {
        resource_group_name = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-0001"
        name                = "id-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-0002"
        location            = local.common.location
      }
    }
  }
}
