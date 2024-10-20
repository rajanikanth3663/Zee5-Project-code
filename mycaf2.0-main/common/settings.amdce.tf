locals {
  configure_amdce_resources = {
    settings = {
      "dce-${local.common.bu_name}-${local.common.dep_env}-ci1-0001" = {
        resource_group_name           = local.common.resource_group_name_csvc
        name                          = "dce-${local.common.bu_name}-${local.common.dep_env}-ci1-0001"
        location                      = local.common.location
        kind                          = "Linux"
        public_network_access_enabled = false
      }
    }
  }
}
