locals {
  configure_ai_resources = {
    settings = {
      "appi-${local.common.bu_name}-${local.common.dep_env}-ci1-0001" = {
        resource_group_name = local.common.resource_group_name_csvc
        name                = "appi-${local.common.bu_name}-${local.common.dep_env}-ci1-0001"
        location            = local.common.location
        application_type    = "web"
        workspace_id        = local.common.law_workspace_id
      }
    }
  }
}
