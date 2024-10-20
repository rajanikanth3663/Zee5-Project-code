locals {
  configure_streamanalytics = {
    settings = {
      "strmacls-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001" = {

        resource_group_name = local.common.resource_group_name_csvc
        name                = "stmacls-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
        location            = local.common.location
        streaming_capacity  = "36"


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

        managed_private_endpoint = [
          {
            endpoint_name      = "Blob1"
            target_resource_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Storage/storageAccounts/stxx77${local.common.dep_env}ci1csvc0001"
            subresource_name   = "blob"

          },
          {
            endpoint_name      = "cosmos001"
            target_resource_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.DocumentDB/databaseAccounts/cosmos-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
            subresource_name   = "Sql"
          },
          {
            endpoint_name      = "functionapp"
            target_resource_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-${local.common.bu_name}-${local.common.dep_env}-ci1-cms-0001/providers/Microsoft.Web/sites/fa-${local.common.bu_name}-${local.common.dep_env}-ci1-cms-0022"
            subresource_name   = "sites"
          },
          {
            endpoint_name      = "SQL"
            target_resource_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Sql/servers/sqlsvr-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
            subresource_name   = "sqlServer"
          },
          {
            endpoint_name      = "streamanalytics-eventhubpbtept"
            target_resource_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.EventHub/namespaces/ehdedns-${local.common.bu_name}-${local.common.dep_env}-ci1-hub-0001"
            subresource_name   = "namespace"
          },
          {
            endpoint_name      = "streamanalytics-eventhubpbtept2"
            target_resource_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.EventHub/namespaces/ehns-${local.common.bu_name}-${local.common.dep_env}-ci1-hub-0003"
            subresource_name   = "namespace"
          }
        ]
      }
    }
  }
}
