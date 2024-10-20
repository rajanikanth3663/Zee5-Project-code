locals {
  configure_amdcra_resources = {
    settings = {
      "aks-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001" = {
        target_resource_id          = module.aks["aks-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"].id
        data_collection_endpoint_id = module.amdce["dce-${local.common.bu_name}-${local.common.dep_env}-ci1-0001"].id
      }

      "aks-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0002" = {
        target_resource_id          = module.aks["aks-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0002"].id
        data_collection_endpoint_id = module.amdce["dce-${local.common.bu_name}-${local.common.dep_env}-ci1-0001"].id
      }
    }
  }
}
