locals {
  configure_rsv_resources = {
    settings = {

      "rsv-${local.common.bu_name}-${local.common.dep_env}-ci1-0001" = {
        location            = local.common.location
        resource_group_name = local.common.resource_group_name_csvc
        name                = "rsv-${local.common.bu_name}-${local.common.dep_env}-ci1-0001"

        private_endpoint = [{
          endpoint_name        = "pep-${local.common.bu_name}-${local.common.dep_env}-ci1-rsv-0001"
          subnet_id            = local.csvc_subnet_id["snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"]
          connection_name      = "pep-${local.common.bu_name}-${local.common.dep_env}-ci1-rsv-0001"
          private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/${local.common.resource_group_name_hubdns}/providers/Microsoft.Network/privateDnsZones/privatelink.siterecovery.windowsazure.com"]
          subresource_names    = ["AzureSiteRecovery"]
        }]

        backup_policy_vm = [{
          name = "bkpol-${local.common.bu_name}-${local.common.dep_env}-ci1-0001"
          }
        ]

        backup_protected_vm = concat([
          for vm_name in [
            "csvcdis-0001",
            "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-imgr-0001",
            "solrvm4",
            "solrvm5",
            "solrvm6",
            "solrvm7",
            "solrvm8",
            "solrvm9",
            ] : {
            source_vm_id     = module.vm-linux-customimage[vm_name].id
            backup_policy_id = local.common.backup_policy_id
          }
          ],
          [
            for vm_name in [
              "kafka0001",
              "etl0001",
              "rdbmsslave0001",
              "datascience0001",
              "rdbmsmaster0001",
              "dbox0001",
              "druid0001",
              "cardinality0001",
              "redis0001",
              "dboxnonrequest0001",
              "bloomfilter0001",


              ] : {
              source_vm_id     = module.vm_linux_customimagev3[vm_name].id
              backup_policy_id = local.common.backup_policy_id
            }
          ]
        )
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
