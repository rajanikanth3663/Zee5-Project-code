locals {
  configure_keyvault_resources = {
    settings = {
      "kv-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-001" = {
        resource_group_name      = local.common.resource_group_name_csvc
        azurerm_key_vault_name   = "kv-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-001"
        location                 = local.common.location
        purge_protection_enabled = true
        network_rules = {
          default_action             = "Deny"
          virtual_network_subnet_ids = []
        }
        tenant_id = local.tenant_id
        private_endpoint = {
          endpoint_name   = "pep-${local.common.bu_name}-np-ci1-${local.common.app_name}kv-0001"
          subnet_id       = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
          connection_name = "kvcms-pvt-connection"
        }
        tags = {
          "service-name"       = ""
          "BusinessUnit"       = ""
          "CostCenter"         = ""
          "DisasterRecovery"   = ""
          "environment"        = ""
          "OwnerName"          = ""
          "servicecriticality" = ""
          "ISV"                = ""
          "DataClassification" = ""
          "service-family"     = ""
          "ticket-id"          = ""
          "lead-spoc"          = ""
          "created_by"         = ""
          "Created_Date"       = ""
          "Updated_Date"       = ""
        }
      }

      "kv-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_cms}-0001" = {
        resource_group_name      = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_cms}-0001"
        azurerm_key_vault_name   = "kv-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_cms}-0001"
        location                 = local.common.location
        purge_protection_enabled = true
        network_rules = {
          default_action             = "Deny"
          virtual_network_subnet_ids = []
        }
        tenant_id = local.tenant_id
        private_endpoint = {
          endpoint_name        = "pep-${local.common.bu_name}-np-ci1-kv${local.common.app_name_cms}-0001"
          subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
          connection_name      = "kv${local.common.app_name_cms}-pvt-connection"
          private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/${local.common.resource_group_name_hubdns}/providers/Microsoft.Network/privateDnsZones/privatelink.vaultcore.azure.net"]
        }
        tags = {
          "service-name"       = ""
          "BusinessUnit"       = ""
          "CostCenter"         = ""
          "DisasterRecocmsry"  = ""
          "environment"        = ""
          "OwnerName"          = ""
          "servicecriticality" = ""
          "ISV"                = ""
          "DataClassification" = ""
          "service-family"     = ""
          "ticket-id"          = ""
          "lead-spoc"          = ""
          "created_by"         = ""
          "Created_Date"       = ""
          "Updated_Date"       = ""
        }
      }

      "kv-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-0001" = {
        resource_group_name      = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-0001"
        azurerm_key_vault_name   = "kv-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-0001"
        location                 = local.common.location
        purge_protection_enabled = true
        network_rules = {
          default_action             = "Deny"
          virtual_network_subnet_ids = []
        }
        tenant_id = local.tenant_id
        private_endpoint = {
          endpoint_name        = "pep-${local.common.bu_name}-np-ci1-${local.common.app_name_ve}kv-0001"
          subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
          connection_name      = "kv${local.common.app_name_ve}-pvt-connection"
          private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/${local.common.resource_group_name_hubdns}/providers/Microsoft.Network/privateDnsZones/privatelink.vaultcore.azure.net"]
        }
        tags = {
          "service-name"       = ""
          "BusinessUnit"       = ""
          "CostCenter"         = ""
          "DisasterRecovery"   = ""
          "environment"        = ""
          "OwnerName"          = ""
          "servicecriticality" = ""
          "ISV"                = ""
          "DataClassification" = ""
          "service-family"     = ""
          "ticket-id"          = ""
          "lead-spoc"          = ""
          "created_by"         = ""
          "Created_Date"       = ""
          "Updated_Date"       = ""
        }
      }
    }
  }
}
