locals {
  configure_amplss_resources = {
    settings = {
      "amplss-${local.common.bu_name}-np-ci1-hub-0001-law${local.common.dep_env}" = {
        resource_group_name = "rg-${local.common.bu_name}-np-ci1-hubconnectivity-0001"
        name                = "amplss-${local.common.bu_name}-np-ci1-hub-0001-law${local.common.dep_env}"
        scope_name          = "ampls-${local.common.bu_name}-np-ci1-hub-0001"
        linked_resource_id  = module.law["log-${local.common.bu_name}-${local.common.dep_env}-ci1-0001"].id
      }
      "amplss-${local.common.bu_name}-np-ci1-hub-0001-ai${local.common.dep_env}" = {
        resource_group_name = "rg-${local.common.bu_name}-np-ci1-hubconnectivity-0001"
        name                = "amplss-${local.common.bu_name}-np-ci1-hub-0001-ai${local.common.dep_env}"
        scope_name          = "ampls-${local.common.bu_name}-np-ci1-hub-0001"
        linked_resource_id  = module.ai["appi-${local.common.bu_name}-${local.common.dep_env}-ci1-0001"].id
      }

      "amplss-${local.common.bu_name}-np-ci1-hub-0001-dce${local.common.dep_env}" = {
        resource_group_name = "rg-${local.common.bu_name}-np-ci1-hubconnectivity-0001"
        name                = "amplss-${local.common.bu_name}-np-ci1-hub-0001-dce${local.common.dep_env}"
        scope_name          = "ampls-${local.common.bu_name}-np-ci1-hub-0001"
        linked_resource_id  = module.amdce["dce-${local.common.bu_name}-${local.common.dep_env}-ci1-0001"].id
      }
    }
  }
}
