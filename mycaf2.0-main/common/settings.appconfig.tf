locals {
  appconfig_tags = {
    "ApplicationName"    = ""
    "BusinessUnit"       = ""
    "CostCenter"         = ""
    "Description"        = ""
    "DisasterRecovery"   = ""
    "environment"        = ""
    "OwnerName"          = ""
    "RequesterName"      = ""
    "ServiceClass"       = ""
    "ISV"                = ""
    "DataClassification" = ""
  }
  configure_appconfig_resources = {
    settings = {
      "appconfig-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001" = {
        name                       = "appconfig-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
        resource_group_name        = local.common.resource_group_name_csvc
        location                   = local.common.location
        sku                        = "standard"
        local_auth_enabled         = true
        public_network_access      = "Disabled"
        purge_protection_enabled   = false
        soft_delete_retention_days = 1


        # identity = {
        #   identity_ids = ["${data.azurerm_user_assigned_identity.id_aks_managed.id}", "${data.azurerm_user_assigned_identity.id_aks_managed_mc.id}",
        #   "${data.azurerm_user_assigned_identity.id_aks_managed_mc02.id}"]
        # }

        private_endpoint = {
          endpoint_name        = "pep-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-appcon-0001"
          subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
          connection_name      = "appconfig-poc-pvt-connection"
          private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/${local.common.resource_group_name_hubdns}/providers/Microsoft.Network/privateDnsZones/privatelink.azconfig.io"]
        }

      }
    }
  }
}
