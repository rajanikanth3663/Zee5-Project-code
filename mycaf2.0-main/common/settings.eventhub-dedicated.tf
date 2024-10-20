locals {
  configure_eventhub_dedicated_resources = {
    settings = {
      "ehcls-${local.common.bu_name}-${local.common.dep_env}-ci1-hub-0001" = {
        resource_group_name = local.common.resource_group_name_csvc
        name                = "ehcls-${local.common.bu_name}-${local.common.dep_env}-ci1-hub-0001"
        location            = local.common.location
      }
    }
  }
}
