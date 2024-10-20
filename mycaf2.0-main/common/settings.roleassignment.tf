locals {
  configure_role_assignments = {
    settings = {

      aks001-vmss-identity-kv01 = {
        scope                = module.keyvault["kv-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-001"].id
        role_definition_name = "Key Vault Secrets User"
        principal_id         = module.aks["aks-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"].kube_identity
      }

      "aks-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0002-agentpool-appconfig-kv" = {
        scope                = module.keyvault["kv-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-001"].id
        role_definition_name = "Key Vault Secrets User"
        principal_id         = module.aks["aks-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0002"].kube_identity
      }
      "aks-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-0001-agentpool-appconfig-kv" = {
        scope                = module.keyvault["kv-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-0001"].id
        role_definition_name = "Key Vault Secrets User"
        principal_id         = module.aks["aks-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-0001"].kube_identity
      }

      "aks-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001-dataOwner" = {
        scope                = module.appconfig["appconfig-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"].id
        role_definition_name = "App Configuration Data Owner"
        principal_id         = module.aks["aks-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"].kube_identity
      }
      "aks-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0002-dataOwner" = {
        scope                = module.appconfig["appconfig-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"].id
        role_definition_name = "App Configuration Data Owner"
        principal_id         = module.aks["aks-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0002"].kube_identity
      }
      "aks-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-0001" = {
        scope                = module.appconfig["appconfig-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"].id
        role_definition_name = "App Configuration Data Owner"
        principal_id         = module.aks["aks-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-0001"].kube_identity
      }

      "appconfig-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001-Data-Owner-current" = {
        scope                = module.appconfig["appconfig-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"].id
        role_definition_name = "App Configuration Data Owner"
        principal_id         = data.azurerm_client_config.current.object_id
      }
      "aks-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001-kv-secret" = {
        scope                = module.appconfig["appconfig-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"].id
        role_definition_name = "Key Vault Secrets User"
        principal_id         = module.aks["aks-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"].kube_identity
      }
      "seventhub-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001-sender" = {
        scope                = "/subscriptions/subs3-******-******/resourceGroups/rg-its-np-ci1-mgmt-0001/providers/Microsoft.EventHub/namespaces/ehns-its-np-ci1-seckeyr-0001"
        role_definition_name = "Azure Event Hubs Data sender"
        principal_id         = module.event-grid-kv["egst-${local.common.bu_name}-${local.common.dep_env}-ci1-ve-kv-0001"].identity_principal_id
      }
    }
  }
}