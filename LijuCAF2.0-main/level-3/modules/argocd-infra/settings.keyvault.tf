locals {
  configure_keyvault_resources = {
    settings = {
      resource_group_name    = "rg-ott007-np-ci1-hubdevops-0001"
      azurerm_key_vault_name = "kv-ott007-np-ci1-hub-0001"
      location               = "centralindia"
      network_rules = {
        default_action             = "Deny"
        virtual_network_subnet_ids = []
      }
      tenant_id = local.tenant_id
      private_endpoint = {
        endpoint_name   = "pep-ott007-np-ci1-hubkv-0001"
        subnet_id       = "/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubconnectivity-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-np-ci1-hub-0001/subnets/snet-ott007-np-ci1-devops-0001"
        connection_name = "nphubkv-pvt-connection"
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
