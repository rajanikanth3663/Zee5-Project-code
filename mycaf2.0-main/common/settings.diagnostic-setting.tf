locals {
  diagnostics_settings_resource_names = {

    vnet = [
      "vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001",
      "vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_medthek}-0001",
      "vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ateme}-0001",
    ]

    application_insights = [
      "appi-${local.common.bu_name}-${local.common.dep_env}-ci1-0001"
    ]

    law = [
      "log-${local.common.bu_name}-${local.common.dep_env}-ci1-0001"
    ]

    aks = [
      "aks-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001",
      "aks-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0002",
      "aks-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-0001",
      "aksz5atm1-AKS-cluster"
    ]

    keyvault = [
      "kv-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-001",
    ]

    asp = [
      "asp-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_cms}-0001",
      "asp-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001",
      "asp-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-0001",
      "asp-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-0002",

    ]

    function_app = [
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_cms}-schedule-publish-001",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_cms}-bulkops-asset-update-002",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_cms}-bulkops-publish-003",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_cms}-collection-auto-publish-004",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_cms}-content-status-tracker-005",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_cms}-epg-data-cleanup-006",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_cms}-epg-get-xml-from-s3-007",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_cms}-epg-ingestion-008",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_cms}-epg-publish-009",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_cms}-epg-publish-scheduler-010",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_cms}-ftp-s3-011",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_cms}-lambda-episode-xml-012",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_cms}-licence-scheduler-013",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_cms}-middleware-license-expire-014",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_cms}-notification-015",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_cms}-publish-scheduled-collections-016",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_cms}-scheduled-bulk-operations-017",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_cms}-unpublish-expired-assets-018",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_cms}-vod-autocreate-019",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_cms}-bulkops-asset-creation-020",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_cms}-0021",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_cms}-0022",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_cms}-0023",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_cms}-0024",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_cms}-0025",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_cms}-0026",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_cms}-0027",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-metadata-handler-01",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-copy-script-stitching-02",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-image-refresh-api-03",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-accel-transcoding-04",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-trans-blob-to-sb-05",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-news-${local.common.bu_name}-blob-sync-06",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-toch-handeling-07",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-blob-to-sb-queue-08",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-manifest-rename-09",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-job-creator-10",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-bation-qc-solution-11",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-job-status-ateme-12",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-live-alerts-ateme-13",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-drm-data-to-mongo-db-14",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-post-trans-processing-15",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-dash-manifest-modf-16",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-stitching-function-17",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-appd-url-to-rss-feed-18",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-ateme-input-switching-19",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-re-nbr-blob-to-sb-20",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-re-nbr-sb-to-atem-21",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-aston-bumper-22",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-bento4-packaging-fn-23",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-cp-trans-output-clips-24",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-daily-shrts-sb-create-25",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-hls-subtitle-addition-26",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-renaming-ateme-csv-27",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-cdn-behaviour-28",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-29",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-30",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-31",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-32",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-33",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-34",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-35",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-cs-process1-36",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-cs-process2-37",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-cs-process3-38",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-cs-report-generator-39",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-lease-line-monitor-40",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-news-vod-rss-db-41",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-cache-purge-42",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-redundant-delete-43",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-v2-premium-api-44",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-mediathek-apis-45",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-manifest-creation-46",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-nodejs-47",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-nodejs-48",
      "fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-nodejs-49",
    ]

    # nsg = [
    #   "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-apim-0001",
    #   "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-aks-0002",
    #   "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-aks-0003",
    #   "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-aks-0004",
    #   "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007",
    #   "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008",
    #   "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-data-mysql-0009",
    #   "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-data-psql-0010",
    #   "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-fappint-0011",
    #   "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-fappint-0012",
    #   "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-adbcon-0005",
    #   "nsg-${local.common.bu_name}-${local.common.dep_env}-ci1-adbhost-0006"
    # ]

    vm_linux_customimage = [
      "csvcdis-0001",
      "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-imgr-0001",
      "solrvm4",
      "solrvm5",
      "solrvm6",
      "solrvm7",
      "solrvm8",
      "solrvm9",

    ]

    storage_account = [
      "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name}0001",
      "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name}0002",
      "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name}0003",
      "adtechstorage1",
      "st${local.common.bu_name}adtek${local.common.dep_env}ci1boot002",
      "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name_cms}0002",
      "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name_cms}0001",
      "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name_cms}0003",
      "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name_cms}rss0001",
      "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name_ve}0001",
      "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name_ve}0002",
    ]

    # mssql = [
    #   "sqlsvr-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
    # ]

    apim = [
      "apim-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
    ]

    appconfig = [
      "appconfig-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
    ]

    eventhub_namespace = [
      "ehdedns-${local.common.bu_name}-${local.common.dep_env}-ci1-hub-0001"
    ]

    cosmosdb_cassandra = [
      "cosmos-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001",
      "cosmos-${local.common.bu_name}-${local.common.dep_env}-ci1-cmsrss-0001",

    ]

    cosmosdb_mongo = [
      "cosmos-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0002",
    ]

    mysql_flexible = [
      "mysql-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
    ]

    postgres_flexible = [
      "psql-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001",
    ]

    event_grid_st = [
      "egst-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-st-0001"
    ]

    rediscache = [
      "redis-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
    ]

    # this resourse for all mertics
    other_resource_id = [
      "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Cache/redisEnterprise/redisen-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001",
      #   "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Storage/storageAccounts/st${local.common.bu_name}${local.common.dep_env}ci1csvc0003",
      #   "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Web/sites/fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-sensara-001",
      #   "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Web/sites/fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-azureblobtrigger-002",
      #   "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Web/sites/fa-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-netstoragesync-003",
      #   "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.RecoveryServices/vaults/rsv-${local.common.bu_name}-${local.common.dep_env}-ci1-0001",
      #   "/subscriptions/${local.subscription_id}/resourceGroups/rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_medthek}-0001/providers/Microsoft.Network/publicIPAddresses/pip-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_medthek}-0001",
      #   "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/loadBalancers/lb-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0001",
      #   "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Communication/CommunicationServices/acs-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
    ]
  }
}
locals {
  configure_diagnostic_setting_resources = {
    settings = merge(
      {
        for name in local.diagnostics_settings_resource_names.rediscache : "diag-${name}" => {
          name                       = "diag-${name}"
          target_resource_id         = module.rediscache["${name}"].id
          log_analytics_workspace_id = local.common.hub_law_id

          metric = [{
            category = "AllMetrics"
            enabled  = true
          }]
        }
      },
      {
        for name in local.diagnostics_settings_resource_names.event_grid_st : "diag-${name}" => {
          name                       = "diag-${name}"
          target_resource_id         = module.event-grid-st["${name}"].id
          log_analytics_workspace_id = local.common.hub_law_id

          metric = [{
            category = "AllMetrics"
            enabled  = true
          }]
        }
      },

      {
        for name in local.diagnostics_settings_resource_names.law : "diag-${name}" => {
          name                       = "diag-${name}"
          target_resource_id         = module.law["${name}"].id
          log_analytics_workspace_id = local.common.hub_law_id

          metric = [{
            category = "AllMetrics"
            enabled  = true
          }]
        }
      },

      {
        for name in local.diagnostics_settings_resource_names.postgres_flexible : "diag-${name}" => {
          name                       = "diag-${name}"
          target_resource_id         = module.postgres-flexible["${name}"].id
          log_analytics_workspace_id = local.common.hub_law_id

          metric = [{
            category = "AllMetrics"
            enabled  = true
          }]
        }
      },

      {
        for name in local.diagnostics_settings_resource_names.mysql_flexible : "diag-${name}" => {
          name                       = "diag-${name}"
          target_resource_id         = module.mysql-flexible["${name}"].id
          log_analytics_workspace_id = local.common.hub_law_id

          metric = [{
            category = "AllMetrics"
            enabled  = true
          }]
        }
      },
      {
        for name in local.diagnostics_settings_resource_names.cosmosdb_mongo : "diag-${name}" => {
          name                       = "diag-${name}"
          target_resource_id         = module.cosmosdb-mongo["${name}"].id
          log_analytics_workspace_id = local.common.hub_law_id

          metric = [{
            category = "AllMetrics"
            enabled  = true
          }]
        }
      },
      {
        for name in local.diagnostics_settings_resource_names.cosmosdb_cassandra : "diag-${name}" => {
          name                       = "diag-${name}"
          target_resource_id         = module.cosmosdb-cassandra["${name}"].id
          log_analytics_workspace_id = local.common.hub_law_id

          metric = [{
            category = "AllMetrics"
            enabled  = true
          }]
        }
      },
      {
        for name in local.diagnostics_settings_resource_names.asp : "diag-${name}" => {
          name                       = "diag-${name}"
          target_resource_id         = module.asp["${name}"].id
          log_analytics_workspace_id = local.common.hub_law_id

          metric = [{
            category = "AllMetrics"
            enabled  = true
          }]
        }
      },
      {
        for name in local.diagnostics_settings_resource_names.eventhub_namespace : "diag-${name}" => {
          name                       = "diag-${name}"
          target_resource_id         = module.eventhub-ns["${name}"].id
          log_analytics_workspace_id = local.common.hub_law_id

          metric = [{
            category = "AllMetrics"
            enabled  = true
          }]
        }
      },
      {
        for name in local.diagnostics_settings_resource_names.appconfig : "diag-${name}" => {
          name                       = "diag-${name}"
          target_resource_id         = module.appconfig["${name}"].id
          log_analytics_workspace_id = local.common.hub_law_id

          metric = [{
            category = "AllMetrics"
            enabled  = true
          }]
        }
      },
      {
        for name in local.diagnostics_settings_resource_names.apim : "diag-${name}" => {
          name                       = "diag-${name}"
          target_resource_id         = module.apim["${name}"].id
          log_analytics_workspace_id = local.common.hub_law_id

          metric = [{
            category = "AllMetrics"
            enabled  = true
          }]
        }
      },
      #   {
      #     for name in local.diagnostics_settings_resource_names.mssql : "diag-${name}" => {
      #       name                       = "diag-${name}"
      #       target_resource_id         = module.mssql["${name}"].id
      #       log_analytics_workspace_id = local.common.hub_law_id

      #       metric = [{
      #         category = "AllMetrics"
      #         enabled  = true
      #       }]
      #     }
      #   },
      {
        for name in local.diagnostics_settings_resource_names.application_insights : "diag-${name}" => {
          name                       = "diag-${name}"
          target_resource_id         = module.ai["${name}"].id
          log_analytics_workspace_id = local.common.hub_law_id

          metric = [{
            category = "AllMetrics"
            enabled  = true
          }]
        }
      },

      {
        for name in local.diagnostics_settings_resource_names.aks : "diag-${name}" => {
          name                       = "diag-${name}"
          target_resource_id         = module.aks["${name}"].id
          log_analytics_workspace_id = local.common.hub_law_id

          metric = [{
            category = "AllMetrics"
            enabled  = true
          }]
        }
      },
      {
        for name in local.diagnostics_settings_resource_names.keyvault : "diag-${name}" => {
          name                       = "diag-${name}"
          target_resource_id         = module.keyvault["${name}"].id
          log_analytics_workspace_id = local.common.hub_law_id

          metric = [{
            category = "AllMetrics"
            enabled  = true
          }]
        }
      },
      {
        for name in local.diagnostics_settings_resource_names.function_app : "diag-${name}" => {
          name                       = "diag-${name}"
          target_resource_id         = module.function_app["${name}"].id
          log_analytics_workspace_id = local.common.hub_law_id

          metric = [{
            category = "AllMetrics"
            enabled  = true
          }]
        }
      },
      #   {
      #     for name in local.diagnostics_settings_resource_names.nsg : "diag-${name}" => {
      #       name                       = "diag-${name}"
      #       target_resource_id         = module.nsg["${name}"].id
      #       log_analytics_workspace_id = local.common.hub_law_id

      #       enabled_log = [{
      #         category = "NetworkSecurityGroupEvent"
      #         enabled  = true
      #       }]
      #     }
      #   },
      {
        for name in local.diagnostics_settings_resource_names.vm_linux_customimage : "diag-${name}" => {
          name                       = "diag-${name}"
          target_resource_id         = module.vm-linux-customimage["${name}"].id
          log_analytics_workspace_id = local.common.hub_law_id

          metric = [{
            category = "AllMetrics"
            enabled  = true
          }]
        }
      },
      {
        for name in local.diagnostics_settings_resource_names.storage_account : "diag-${name}" => {
          name                       = "diag-${name}"
          target_resource_id         = module.storage-account["${name}"].id
          log_analytics_workspace_id = local.common.hub_law_id

          metric = [{
            category = "AllMetrics"
            enabled  = true
          }]
        }
      },
      {
        for name in local.diagnostics_settings_resource_names.vnet : "diag-${name}" => {
          name                       = "diag-${name}"
          target_resource_id         = module.vnet["${name}"].id
          log_analytics_workspace_id = local.common.hub_law_id

          metric = [{
            category = "AllMetrics"
            enabled  = true
          }]
        }
      },
      {
        for name in local.diagnostics_settings_resource_names.other_resource_id : "diag-${basename(name)}" => {
          name                       = "diag-${basename(name)}"
          target_resource_id         = "${name}"
          log_analytics_workspace_id = local.common.hub_law_id

          metric = [{
            category = "AllMetrics"
            enabled  = true
          }]
        }
      }

    )
  }
}
