locals {
  common_cms_function_app_resources_settings = {
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
    storage_account_id = module.storage-account["st${local.bu_name}${local.dep_env}ci1${local.app_name_cms}0002"].id
  }
  #Nodejs
  function_app_names_cms_nodejs = [
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_cms}-schedule-publish-001",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_cms}-bulkops-asset-update-002",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_cms}-bulkops-publish-003",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_cms}-collection-auto-publish-004",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_cms}-content-status-tracker-005",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_cms}-epg-data-cleanup-006",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_cms}-epg-get-xml-from-s3-007",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_cms}-epg-ingestion-008",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_cms}-epg-publish-009",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_cms}-epg-publish-scheduler-010",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_cms}-ftp-s3-011",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_cms}-lambda-episode-xml-012",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_cms}-licence-scheduler-013",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_cms}-middleware-license-expire-014",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_cms}-notification-015",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_cms}-publish-scheduled-collections-016",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_cms}-scheduled-bulk-operations-017",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_cms}-unpublish-expired-assets-018",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_cms}-vod-autocreate-019",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_cms}-bulkops-asset-creation-020",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_cms}-0021",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_cms}-0022",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_cms}-0023",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_cms}-0024",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_cms}-0025",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_cms}-0026",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_cms}-0027",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_cms}-articlelifestylevideo"
  ]
  function_app_names_cms_rssfeed001_nodejs = [
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_cms}-rss-001",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_cms}-rss-002"
  ]

  #private endpoint 0000
  function_app_names_ve_python_asp1 = [
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-metadata-handler-01",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-copy-script-stitching-02",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-image-refresh-api-03",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-accel-transcoding-04",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-trans-blob-to-sb-05",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-news-${local.bu_name}-blob-sync-06",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-toch-handeling-07",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-blob-to-sb-queue-08",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-manifest-rename-09",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-job-creator-10",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-bation-qc-solution-11",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-job-status-ateme-12",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-live-alerts-ateme-13",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-drm-data-to-mongo-db-14",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-post-trans-processing-15",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-dash-manifest-modf-16",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-stitching-function-17"
  ]

  #private endpoint 0000
  function_app_names_ve_python_asp2 = [
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-appd-url-to-rss-feed-18",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-ateme-input-switching-19",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-re-nbr-blob-to-sb-20",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-re-nbr-sb-to-atem-21",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-aston-bumper-22",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-bento4-packaging-fn-23",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-cp-trans-output-clips-24",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-daily-shrts-sb-create-25",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-hls-subtitle-addition-26",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-renaming-ateme-csv-27",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-cdn-behaviour-28",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-29",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-30",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-31",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-32",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-33",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-34",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-35",
  ]
  #private endpoint 00
  function_app_names_ve_python_asp1_v2 = [
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-cs-process1-36",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-cs-process2-37",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-cs-process3-38",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-cs-report-generator-39",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-lease-line-monitor-40",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-news-vod-rss-db-41",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-cache-purge-42",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-redundant-delete-43",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-v2-premium-api-44",
  ]
  #private endpoint 00
  function_app_names_ve_python_asp2_v2 = [

  ]

  #private endpoint 00
  function_app_names_ve_nodejs_asp2 = [
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-mediathek-apis-45",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-manifest-creation-46",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-nodejs-47",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-nodejs-48",
    "fa-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-nodejs-49",
  ]

}
locals {
  configure_function_app_resources = {
    settings = merge(
      {
        for name in local.function_app_names_cms_nodejs : "${name}" => {
          name                       = "${name}"
          location                   = local.location
          resource_group_name        = "rg-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_cms}-0001"
          service_plan_id            = "/subscriptions/${local.subscription_id}/resourceGroups/rg-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_cms}-0001/providers/Microsoft.Web/serverFarms/asp-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_cms}-0001"
          storage_account_name       = "st${local.bu_name}${local.dep_env}ci1cms0002"
          storage_account_access_key = module.storage-account["st${local.bu_name}${local.dep_env}ci1cms0002"].primary_access_key
          storage_account_id         = local.common_cms_function_app_resources_settings.storage_account_id

          application_stack = {
            node_version = "18"
          }

          app_settings = {
            "APPINSIGHTS_INSTRUMENTATIONKEY" = module.ai["appi-${local.bu_name}-${local.dep_env}-ci1-0001"].instrumentation_key
          }

          identity = {
            type         = "UserAssigned"
            identity_ids = [module.uai["id-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_cms}-0001"].id]
          }

          virtual_network_subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.bu_name}-${local.dep_env}-ci1-csvc-0001/subnets/snet-${local.bu_name}-${local.dep_env}-ci1-fappint-0006"

          private_endpoint = {
            endpoint_name        = "pep-${local.bu_name}-np-ci1-cmsfa-0${substr(name, length(name) - 3, 3)}"
            subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/${local.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.bu_name}-${local.dep_env}-ci1-csvc-0001/subnets/snet-${local.bu_name}-${local.dep_env}-ci1-app-0007"
            connection_name      = "pep-${local.bu_name}-np-ci1-cmsfa-0${substr(name, length(name) - 3, 3)}"
            private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/rg-${local.bu_name}-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.azurewebsites.net"]
          }

          tags = local.common_cms_function_app_resources_settings.tags

        }
      },
      {
        for name in local.function_app_names_ve_python_asp1 : "${name}" => {
          name                       = "${name}"
          location                   = local.location
          resource_group_name        = "rg-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-0001"
          service_plan_id            = "/subscriptions/${local.subscription_id}/resourceGroups/rg-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-0001/providers/Microsoft.Web/serverFarms/asp-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-0001"
          storage_account_name       = "st${local.bu_name}${local.dep_env}ci1${local.app_name_ve}0001"
          storage_account_access_key = module.storage-account["st${local.bu_name}${local.dep_env}ci1${local.app_name_ve}0001"].primary_access_key
          storage_account_id         = module.storage-account["st${local.bu_name}${local.dep_env}ci1${local.app_name_ve}0001"].id

          application_stack = {
            python_version = "3.11"
          }

          app_settings = {
            "APPINSIGHTS_INSTRUMENTATIONKEY" = module.ai["appi-${local.bu_name}-${local.dep_env}-ci1-0001"].instrumentation_key
          }

          identity = {
            type         = "UserAssigned"
            identity_ids = [module.uai["id-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-0001"].id]
          }

          virtual_network_subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.bu_name}-${local.dep_env}-ci1-csvc-0001/subnets/snet-${local.bu_name}-${local.dep_env}-ci1-fappint-0005"

          private_endpoint = {
            endpoint_name        = "pep-${local.bu_name}-np-ci1-vefa-00${substr(name, length(name) - 2, 2)}"
            subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/${local.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.bu_name}-${local.dep_env}-ci1-csvc-0001/subnets/snet-${local.bu_name}-${local.dep_env}-ci1-app-0007"
            connection_name      = "pep-${local.bu_name}-np-ci1-vefa-00${substr(name, length(name) - 2, 2)}"
            private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/rg-${local.bu_name}-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.azurewebsites.net"]
          }

          tags = local.common_cms_function_app_resources_settings.tags

        }
      },

      #function_app_names_cms_ve_asp2 
      {
        for name in local.function_app_names_ve_python_asp2 : "${name}" => {
          name                       = "${name}"
          location                   = local.location
          resource_group_name        = "rg-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-0001"
          service_plan_id            = "/subscriptions/${local.subscription_id}/resourceGroups/rg-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-0001/providers/Microsoft.Web/serverFarms/asp-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-0002"
          storage_account_name       = "st${local.bu_name}${local.dep_env}ci1${local.app_name_ve}0001"
          storage_account_access_key = module.storage-account["st${local.bu_name}${local.dep_env}ci1${local.app_name_ve}0001"].primary_access_key
          storage_account_id         = module.storage-account["st${local.bu_name}${local.dep_env}ci1${local.app_name_ve}0001"].id

          application_stack = {
            python_version = "3.11"
          }

          app_settings = {
            "APPINSIGHTS_INSTRUMENTATIONKEY" = module.ai["appi-${local.bu_name}-${local.dep_env}-ci1-0001"].instrumentation_key
          }

          identity = {
            type         = "UserAssigned"
            identity_ids = [module.uai["id-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-0001"].id]
          }

          virtual_network_subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.bu_name}-${local.dep_env}-ci1-csvc-0001/subnets/snet-${local.bu_name}-${local.dep_env}-ci1-fappint-0004"

          private_endpoint = {
            endpoint_name        = "pep-${local.bu_name}-np-ci1-vefa-00${substr(name, length(name) - 2, 2)}"
            subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/${local.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.bu_name}-${local.dep_env}-ci1-csvc-0001/subnets/snet-${local.bu_name}-${local.dep_env}-ci1-app-0007"
            connection_name      = "pep-${local.bu_name}-np-ci1-vefa-00${substr(name, length(name) - 2, 2)}"
            private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/rg-${local.bu_name}-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.azurewebsites.net"]
          }

          tags = local.common_cms_function_app_resources_settings.tags

        }
      },
      {
        for name in local.function_app_names_ve_python_asp1_v2 : "${name}" => {
          name                       = "${name}"
          location                   = local.location
          resource_group_name        = "rg-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-0001"
          service_plan_id            = "/subscriptions/${local.subscription_id}/resourceGroups/rg-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-0001/providers/Microsoft.Web/serverFarms/asp-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-0001"
          storage_account_name       = "st${local.bu_name}${local.dep_env}ci1${local.app_name_ve}0001"
          storage_account_access_key = module.storage-account["st${local.bu_name}${local.dep_env}ci1${local.app_name_ve}0001"].primary_access_key
          storage_account_id         = module.storage-account["st${local.bu_name}${local.dep_env}ci1${local.app_name_ve}0001"].id

          application_stack = {
            python_version = "3.11"
          }

          app_settings = {
            "APPINSIGHTS_INSTRUMENTATIONKEY" = module.ai["appi-${local.bu_name}-${local.dep_env}-ci1-0001"].instrumentation_key
          }

          identity = {
            type         = "UserAssigned"
            identity_ids = [module.uai["id-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-0001"].id]
          }

          virtual_network_subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.bu_name}-${local.dep_env}-ci1-csvc-0001/subnets/snet-${local.bu_name}-${local.dep_env}-ci1-fappint-0005"

          private_endpoint = {
            endpoint_name        = "pep-${local.bu_name}-np-ci1-vefa-${substr(name, length(name) - 2, 2)}"
            subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/${local.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.bu_name}-${local.dep_env}-ci1-csvc-0001/subnets/snet-${local.bu_name}-${local.dep_env}-ci1-app-0007"
            connection_name      = "pep-${local.bu_name}-np-ci1-vefa-${substr(name, length(name) - 2, 2)}"
            private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/rg-${local.bu_name}-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.azurewebsites.net"]
          }

          tags = local.common_cms_function_app_resources_settings.tags

        }
      },
      {
        for name in local.function_app_names_ve_python_asp2_v2 : "${name}" => {
          name                       = "${name}"
          location                   = local.location
          resource_group_name        = "rg-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-0001"
          service_plan_id            = "/subscriptions/${local.subscription_id}/resourceGroups/rg-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-0001/providers/Microsoft.Web/serverFarms/asp-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-0002"
          storage_account_name       = "st${local.bu_name}${local.dep_env}ci1${local.app_name_ve}0001"
          storage_account_access_key = module.storage-account["st${local.bu_name}${local.dep_env}ci1${local.app_name_ve}0001"].primary_access_key
          storage_account_id         = module.storage-account["st${local.bu_name}${local.dep_env}ci1${local.app_name_ve}0001"].id

          application_stack = {
            python_version = "3.11"
          }

          app_settings = {
            "APPINSIGHTS_INSTRUMENTATIONKEY" = module.ai["appi-${local.bu_name}-${local.dep_env}-ci1-0001"].instrumentation_key
          }

          identity = {
            type         = "UserAssigned"
            identity_ids = [module.uai["id-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-0001"].id]
          }

          virtual_network_subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.bu_name}-${local.dep_env}-ci1-csvc-0001/subnets/snet-${local.bu_name}-${local.dep_env}-ci1-fappint-0004"

          private_endpoint = {
            endpoint_name        = "pep-${local.bu_name}-np-ci1-vefa-${substr(name, length(name) - 2, 2)}"
            subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/${local.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.bu_name}-${local.dep_env}-ci1-csvc-0001/subnets/snet-${local.bu_name}-${local.dep_env}-ci1-app-0007"
            connection_name      = "pep-${local.bu_name}-np-ci1-vefa-${substr(name, length(name) - 2, 2)}"
            private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/rg-${local.bu_name}-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.azurewebsites.net"]
          }

          tags = local.common_cms_function_app_resources_settings.tags

        }
      },
      {
        for name in local.function_app_names_ve_nodejs_asp2 : "${name}" => {
          name                       = "${name}"
          location                   = local.location
          resource_group_name        = "rg-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-0001"
          service_plan_id            = "/subscriptions/${local.subscription_id}/resourceGroups/rg-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-0001/providers/Microsoft.Web/serverFarms/asp-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-0002"
          storage_account_name       = "st${local.bu_name}${local.dep_env}ci1${local.app_name_ve}0001"
          storage_account_access_key = module.storage-account["st${local.bu_name}${local.dep_env}ci1${local.app_name_ve}0001"].primary_access_key
          storage_account_id         = module.storage-account["st${local.bu_name}${local.dep_env}ci1${local.app_name_ve}0001"].id

          application_stack = {
            node_version = "18"
          }

          app_settings = {
            "APPINSIGHTS_INSTRUMENTATIONKEY" = module.ai["appi-${local.bu_name}-${local.dep_env}-ci1-0001"].instrumentation_key
          }

          identity = {
            type         = "UserAssigned"
            identity_ids = [module.uai["id-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_ve}-0001"].id]
          }

          virtual_network_subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.bu_name}-${local.dep_env}-ci1-csvc-0001/subnets/snet-${local.bu_name}-${local.dep_env}-ci1-fappint-0004"

          private_endpoint = {
            endpoint_name        = "pep-${local.bu_name}-np-ci1-vefa-${substr(name, length(name) - 2, 2)}"
            subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/${local.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.bu_name}-${local.dep_env}-ci1-csvc-0001/subnets/snet-${local.bu_name}-${local.dep_env}-ci1-app-0007"
            connection_name      = "pep-${local.bu_name}-np-ci1-vefa-${substr(name, length(name) - 2, 2)}"
            private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/${local.resource_group_name_hubdns}/providers/Microsoft.Network/privateDnsZones/privatelink.azurewebsites.net"]
          }

          tags = local.common_cms_function_app_resources_settings.tags

        }
      },
      #functionapp rssfeed
      {
        for name in local.function_app_names_cms_rssfeed001_nodejs : "${name}" => {
          name                       = "${name}"
          location                   = local.location
          resource_group_name        = "rg-${local.bu_name}-${local.dep_env}-ci1-rssfeed-001"
          service_plan_id            = "/subscriptions/${local.subscription_id}/resourceGroups/rg-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_cms}-0001/providers/Microsoft.Web/serverFarms/asp-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_cms}-0001"
          storage_account_name       = "st${local.bu_name}${local.dep_env}ci1cms0002"
          storage_account_access_key = module.storage-account["st${local.bu_name}${local.dep_env}ci1cms0002"].primary_access_key
          storage_account_id         = local.common_cms_function_app_resources_settings.storage_account_id

          application_stack = {
            node_version = "18"
          }

          app_settings = {
            "APPINSIGHTS_INSTRUMENTATIONKEY" = module.ai["appi-${local.bu_name}-${local.dep_env}-ci1-0001"].instrumentation_key
          }

          identity = {
            type         = "UserAssigned"
            identity_ids = [module.uai["id-${local.bu_name}-${local.dep_env}-ci1-${local.app_name_cms}-0001"].id]
          }

          virtual_network_subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.bu_name}-${local.dep_env}-ci1-csvc-0001/subnets/snet-${local.bu_name}-${local.dep_env}-ci1-fappint-0006"

          private_endpoint = {
            endpoint_name        = "pep-${local.bu_name}-np-ci1-cmsrssfa-0${substr(name, length(name) - 3, 3)}"
            subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/${local.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.bu_name}-${local.dep_env}-ci1-csvc-0001/subnets/snet-${local.bu_name}-${local.dep_env}-ci1-app-0007"
            connection_name      = "pep-${local.bu_name}-np-ci1-cmsrssfa-0${substr(name, length(name) - 3, 3)}"
            private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/rg-${local.bu_name}-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.azurewebsites.net"]
          }

          tags = local.common_cms_function_app_resources_settings.tags

        }
      }
    )
  }
}

