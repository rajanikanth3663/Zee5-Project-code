locals {
  configure_amws_resources = {
    settings = {
      "mws-${local.common.bu_name}-${local.common.dep_env}-ci1-0001" = {
        resource_group_name = local.common.resource_group_name_csvc
        name                = "${local.common.bu_name}-${local.common.dep_env}-ci1-0001"
        location            = local.common.location
      }
    }
  }
}
