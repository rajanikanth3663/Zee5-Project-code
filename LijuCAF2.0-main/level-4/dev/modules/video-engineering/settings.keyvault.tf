locals {
  configure_keyvault_resources = {
    settings = {
      kv-ott007-dev-ci1-ve-0001 = {
        resource_group_name      = "rg-ott007-dev-ci1-ve-0001"
        azurerm_key_vault_name   = "kv-ott007-dev-ci1-ve-0001"
        location                 = "centralindia"
        purge_protection_enabled = true
        network_rules = {
          default_action             = "Deny"
          virtual_network_subnet_ids = []
        }
        tenant_id = local.tenant_id
        private_endpoint = {
          endpoint_name        = "pep-ott007-np-ci1-vekv-0001"
          subnet_id            = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-app-0007"
          connection_name      = "kvve-pvt-connection"
          private_dns_zone_ids = ["/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.vaultcore.azure.net"]
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
