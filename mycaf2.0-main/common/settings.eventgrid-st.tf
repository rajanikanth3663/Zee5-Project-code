locals {
  configure_eventgrid_st_resources = {
    settings = {

      "egst-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-st-0001" = {
        resource_group_name    = "${local.common.resource_group_name_ve}"
        name                   = "egst-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-st-0001"
        location               = local.common.location
        source_arm_resource_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_ve}/providers/Microsoft.Storage/storageAccounts/st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name_ve}0001"


        system_topic_event_subscription = [
          {
            name                          = "egsub-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-Transcoding-Blob-to-SB-1-0001"
            service_bus_queue_endpoint_id = "/subscriptions/subs-******-******/resourceGroups/rg-xx77-dev-ci1-ve-0001/providers/Microsoft.ServiceBus/namespaces/sb-xx77-dev-ci1-ve-0001/queues/sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-transcoding_blob_to_sb-0002"
            included_event_types          = ["Microsoft.Storage.BlobCreated"]

            advanced_filter = [{
              string_begins_with = [{
                key    = "subject"
                values = ["/blobServices/default/containers/xx77transcoding-source/blobs/Remodelling/watch/AD_OPS/"]

              }]
              string_ends_with = [{
                key    = "subject"
                values = ["mov", "mxf", "mp4"]
              }]
            }]
          },
          {
            name                          = "egsub-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-Transcoding-Blob-to-SB-2-0002"
            service_bus_queue_endpoint_id = "/subscriptions/subs-******-******/resourceGroups/rg-xx77-dev-ci1-ve-0001/providers/Microsoft.ServiceBus/namespaces/sb-xx77-dev-ci1-ve-0001/queues/sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-transcoding_blob_to_sb-0002"

            advanced_filter = [{
              string_begins_with = [{
                key    = "subject"
                values = ["/blobServices/default/containers/xx77transcoding-source/blobs/Remodelling/NEWS/"]

              }]
              string_ends_with = [{
                key    = "subject"
                values = ["mov", "mxf", "mp4"]
              }]
            }]
          },
          {
            name                          = "egsub-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-Transcoding-Blob-to-SB-3-0003"
            service_bus_queue_endpoint_id = "/subscriptions/subs-******-******/resourceGroups/rg-xx77-dev-ci1-ve-0001/providers/Microsoft.ServiceBus/namespaces/sb-xx77-dev-ci1-ve-0001/queues/sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-transcoding_blob_to_sb-0002"

            advanced_filter = [{
              string_begins_with = [{
                key    = "subject"
                values = ["/blobServices/default/containers/xx77transcoding-source/blobs/Remodelling/watch/TRAILERS/"]

              }]
              string_ends_with = [{
                key    = "subject"
                values = ["mp4", "mxf"]
              }]
            }]
          },
          {
            name                          = "egsub-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-Transcoding-Blob-to-SB-4-0004"
            service_bus_queue_endpoint_id = "/subscriptions/subs-******-******/resourceGroups/rg-xx77-dev-ci1-ve-0001/providers/Microsoft.ServiceBus/namespaces/sb-xx77-dev-ci1-ve-0001/queues/sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-transcoding_blob_to_sb-0002"

            advanced_filter = [{
              string_begins_with = [{
                key    = "subject"
                values = ["/blobServices/default/containers/xx77transcoding-source/blobs/Remodelling/watch/MOVIES/"]

              }]
              string_ends_with = [{
                key    = "subject"
                values = ["mp4"]
              }]
            }]
          },
          {
            name                          = "egsub-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-Transcoding-Blob-to-SB-5-0005"
            service_bus_queue_endpoint_id = "/subscriptions/subs-******-******/resourceGroups/rg-xx77-dev-ci1-ve-0001/providers/Microsoft.ServiceBus/namespaces/sb-xx77-dev-ci1-ve-0001/queues/sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-transcoding_blob_to_sb-0002"

            advanced_filter = [{
              string_begins_with = [{
                key    = "subject"
                values = ["/blobServices/default/containers/xx77transcoding-source/blobs/Remodelling/watch/GLOBAL_CONTENT/"]

              }]
              string_ends_with = [{
                key    = "subject"
                values = ["mp4", "mxf"]
              }]
            }]
          },
          {
            name                          = "egsub-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-Transcoding-Blob-to-SB-6-0006"
            service_bus_queue_endpoint_id = "/subscriptions/subs-******-******/resourceGroups/rg-xx77-dev-ci1-ve-0001/providers/Microsoft.ServiceBus/namespaces/sb-xx77-dev-ci1-ve-0001/queues/sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-transcoding_blob_to_sb-0002"

            advanced_filter = [{
              string_begins_with = [{
                key    = "subject"
                values = ["/blobServices/default/containers/xx77transcoding-source/blobs/Remodelling/watch/TV_SHOWS/"]

              }]
              string_ends_with = [{
                key    = "subject"
                values = ["mp4", "mov", "mxf"]
              }]
            }]
          },
          {
            name                          = "egsub-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-Transcoding-Blob-to-SB-7-0007"
            service_bus_queue_endpoint_id = "/subscriptions/subs-******-******/resourceGroups/rg-xx77-dev-ci1-ve-0001/providers/Microsoft.ServiceBus/namespaces/sb-xx77-dev-ci1-ve-0001/queues/sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-transcoding_blob_to_sb-0002"

            advanced_filter = [{
              string_begins_with = [{
                key    = "subject"
                values = ["/blobServices/default/containers/xx77transcoding-source/blobs/Remodelling/watch/KIDS/"]

              }]
              string_ends_with = [{
                key    = "subject"
                values = ["mxf"]
              }]
            }]
          },
          {
            name                          = "egsub-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-Transcoding-Blob-to-SB-8-0009"
            service_bus_queue_endpoint_id = "/subscriptions/subs-******-******/resourceGroups/rg-xx77-dev-ci1-ve-0001/providers/Microsoft.ServiceBus/namespaces/sb-xx77-dev-ci1-ve-0001/queues/sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-transcoding_blob_to_sb-0002"

            advanced_filter = [{
              string_begins_with = [{
                key    = "subject"
                values = ["/blobServices/default/containers/xx77transcoding-source/blobs/Remodelling/watch/MUSIC_VIDEOS/"]

              }]
              string_ends_with = [{
                key    = "subject"
                values = ["mp4", "mov"]
              }]
            }]
          },
          {
            name                          = "egsub-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-Transcoding-Job-Creator-0010"
            service_bus_queue_endpoint_id = "/subscriptions/subs-******-******/resourceGroups/rg-xx77-dev-ci1-ve-0001/providers/Microsoft.ServiceBus/namespaces/sb-xx77-dev-ci1-ve-0001/queues/sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-transcoding_job_creator-0003"

            advanced_filter = [{
              string_begins_with = [{
                key    = "subject"
                values = ["/blobServices/default/containers/xx77transcoding-source/blobs/Remodelling/priority/"]

              }]
              string_ends_with = [{
                key    = "subject"
                values = ["mp4"]
              }]
            }]
          },
          {
            name                          = "egsub-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-Toch-handeling-1-0011"
            service_bus_queue_endpoint_id = "/subscriptions/subs-******-******/resourceGroups/rg-xx77-dev-ci1-ve-0001/providers/Microsoft.ServiceBus/namespaces/sb-xx77-dev-ci1-ve-0001/queues/sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-toch_handeling-0001"

            advanced_filter = [{
              string_begins_with = [{
                key = "subject"
                values = ["/blobServices/default/containers/xx77-toch/blobs/Input_mp4/",
                  "/blobServices/default/containers/xx77-toch/blobs/Output_mp4/"
                ]
              }]
            }]
          },

          {
            name                          = "egsub-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-Toch-handeling-2-0012"
            service_bus_queue_endpoint_id = "/subscriptions/subs-******-******/resourceGroups/rg-xx77-dev-ci1-ve-0001/providers/Microsoft.ServiceBus/namespaces/sb-xx77-dev-ci1-ve-0001/queues/sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-toch_handeling-0001"

            advanced_filter = [{
              string_begins_with = [{
                key    = "subject"
                values = ["/blobServices/default/containers/xx77transcoding-source-regional/blobs/AD_OPS/IN_HOUSE_AdContent/"]

              }]
              string_ends_with = [{
                key    = "subject"
                values = ["mp4"]
              }]
            }]
          },

          {
            name                          = "egsub-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-Image-Refresh-API-0013"
            service_bus_queue_endpoint_id = "/subscriptions/subs-******-******/resourceGroups/rg-xx77-dev-ci1-ve-0001/providers/Microsoft.ServiceBus/namespaces/sb-xx77-dev-ci1-ve-0001/queues/sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-image_refresh_api-0006"

            advanced_filter = [{
              string_begins_with = [{
                key    = "subject"
                values = ["/blobServices/default/containers/frame-meta-sample-videos/blobs/Clips_mp4_download/stitched_Preview/"]

              }]
            }]
          },
          {
            name                          = "egsub-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-Transcoding-Accelerated-0014"
            service_bus_queue_endpoint_id = "/subscriptions/subs-******-******/resourceGroups/rg-xx77-dev-ci1-ve-0001/providers/Microsoft.ServiceBus/namespaces/sb-xx77-dev-ci1-ve-0001/queues/sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-transcoding_accelerated-0007"

            advanced_filter = [{
              string_begins_with = [{
                key    = "subject"
                values = ["/blobServices/default/containers/xx77imagerefresh/blobs/MUSIC/"]

              }]
              string_ends_with = [{
                key    = "subject"
                values = ["psd"]
              }]
            }]
          },

          {
            name                          = "egsub-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-xx77-News-Blob-Sync-0015"
            service_bus_queue_endpoint_id = "/subscriptions/subs-******-******/resourceGroups/rg-xx77-dev-ci1-ve-0001/providers/Microsoft.ServiceBus/namespaces/sb-xx77-dev-ci1-ve-0001/queues/sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-xx77_news_blob_sync-0008"

            advanced_filter = [{
              string_begins_with = [{
                key    = "subject"
                values = ["/blobServices/default/containers/xx77content-ops/"]

              }]
              string_ends_with = [{
                key    = "subject"
                values = ["mp4"]
              }]
            }]
          },

          {
            name                          = "egsub-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-Blob-To-SB-Queue-0016"
            service_bus_queue_endpoint_id = "/subscriptions/subs-******-******/resourceGroups/rg-xx77-dev-ci1-ve-0001/providers/Microsoft.ServiceBus/namespaces/sb-xx77-dev-ci1-ve-0001/queues/sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-blob_to_sb_queue-0009"

            advanced_filter = [{
              string_begins_with = [{
                key    = "subject"
                values = ["/blobServices/default/containers/xx77-sourcefilesinput/"]

              }]

            }]
          },

          {
            name                          = "egsub-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-Stitching-Function-0017"
            service_bus_queue_endpoint_id = "/subscriptions/subs-******-******/resourceGroups/rg-xx77-dev-ci1-ve-0001/providers/Microsoft.ServiceBus/namespaces/sb-xx77-dev-ci1-ve-0001/queues/sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-stitching_function-0005"

            advanced_filter = [{
              string_begins_with = [{
                key    = "subject"
                values = ["/blobServices/default/containers/xx77transcoding-source/blobs/Stitching/"]

              }]

            }]

          },
          {
            name                          = "egsub-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-Aston-Bumper-0018"
            service_bus_queue_endpoint_id = "/subscriptions/subs-******-******/resourceGroups/rg-xx77-dev-ci1-ve-0001/providers/Microsoft.ServiceBus/namespaces/sb-xx77-dev-ci1-ve-0001/queues/sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-aston_bumper-0004"

            advanced_filter = [{
              string_begins_with = [{
                key    = "subject"
                values = ["/blobServices/default/containers/xx77transcoding-source/blobs/Aston_Stitching/"]

              }]

            }]

          },

          {
            name                          = "egsub-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-Copy-Transcoded-Output-Clips-1-0019"
            service_bus_queue_endpoint_id = "/subscriptions/subs-******-******/resourceGroups/rg-xx77-dev-ci1-ve-0001/providers/Microsoft.ServiceBus/namespaces/sb-xx77-dev-ci1-ve-0001/queues/sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-copy_transcoded_output_clips-0034"

            advanced_filter = [{
              string_begins_with = [{
                key    = "subject"
                values = ["/blobServices/default/containers/xx77-transcoding/blobs/mp4/azure/ON_AIR/"]

              }]

              string_ends_with = [{
                key    = "subject"
                values = ["mp4"]
              }]

            }]
          },
          {
            name                          = "egsub-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-Copy-Transcoded-Output-Clips-2-0020"
            service_bus_queue_endpoint_id = "/subscriptions/subs-******-******/resourceGroups/rg-xx77-dev-ci1-ve-0001/providers/Microsoft.ServiceBus/namespaces/sb-xx77-dev-ci1-ve-0001/queues/sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-copy_transcoded_output_clips-0034"

            advanced_filter = [{
              string_begins_with = [{
                key    = "subject"
                values = ["/blobServices/default/containers/xx77-transcoding/blobs/mp4/azure/TV_SHOWS/"]

              }]

              string_ends_with = [{
                key    = "subject"
                values = ["mp4"]
              }]

            }]
          },
          {
            name                          = "egsub-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-Copy-Transcoded-Output-Clips-3-0021"
            service_bus_queue_endpoint_id = "/subscriptions/subs-******-******/resourceGroups/rg-xx77-dev-ci1-ve-0001/providers/Microsoft.ServiceBus/namespaces/sb-xx77-dev-ci1-ve-0001/queues/sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-copy_transcoded_output_clips-0034"

            advanced_filter = [{
              string_begins_with = [{
                key    = "subject"
                values = ["/blobServices/default/containers/xx77-transcoding/blobs/mp4/azure/Music_Videos/"]

              }]

              string_ends_with = [{
                key    = "subject"
                values = ["mp4"]
              }]

            }]
          },
          {
            name                          = "egsub-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-Copy-Transcoded-Output-Clips-4-0022"
            service_bus_queue_endpoint_id = "/subscriptions/subs-******-******/resourceGroups/rg-xx77-dev-ci1-ve-0001/providers/Microsoft.ServiceBus/namespaces/sb-xx77-dev-ci1-ve-0001/queues/sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-copy_transcoded_output_clips-0034"

            advanced_filter = [{
              string_begins_with = [{
                key    = "subject"
                values = ["/blobServices/default/containers/xx77transcoding-source/blobs/Shorts/MUSIC_VIDEOS_PSD/"]

              }]

              string_ends_with = [{
                key    = "subject"
                values = ["psd"]
              }]

            }]
          },
          {
            name                          = "egsub-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-Copy-Transcoded-Output-Clips-5-0023"
            service_bus_queue_endpoint_id = "/subscriptions/subs-******-******/resourceGroups/rg-xx77-dev-ci1-ve-0001/providers/Microsoft.ServiceBus/namespaces/sb-xx77-dev-ci1-ve-0001/queues/sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-copy_transcoded_output_clips-0034"

            advanced_filter = [{
              string_begins_with = [{
                key    = "subject"
                values = ["/blobServices/default/containers/xx77transcoding-source/blobs/Shorts/video/"]

              }]

              string_ends_with = [{
                key    = "subject"
                values = ["mp4"]
              }]

            }]
          },




          {
            name                          = "egsub-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-Copy-HLS-Subtitle-Addition-0024"
            service_bus_queue_endpoint_id = "/subscriptions/subs-******-******/resourceGroups/rg-xx77-dev-ci1-ve-0001/providers/Microsoft.ServiceBus/namespaces/sb-xx77-dev-ci1-ve-0001/queues/sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-bt_hls_subtitle_addition-0035"

            advanced_filter = [{
              string_begins_with = [{
                key    = "subject"
                values = ["/blobServices/default/containers/xx77transcoding-source/blobs/"]

              }]

              string_ends_with = [{
                key    = "subject"
                values = ["vtt"]
              }]

            }]
          },
          {
            name                          = "egsub-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-ReTranscoding-NewBitrate-BlobToSB-0025"
            service_bus_queue_endpoint_id = "/subscriptions/subs-******-******/resourceGroups/rg-xx77-dev-ci1-ve-0001/providers/Microsoft.ServiceBus/namespaces/sb-xx77-dev-ci1-ve-0001/queues/sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-bt_retranscoding_newbitrate_blobtosb-0036"

            advanced_filter = [{
              string_begins_with = [{
                key    = "subject"
                values = ["/blobServices/default/containers/xx77transcoding-source/blobs/Retranscoding/"]

              }]

              string_ends_with = [{
                key    = "subject"
                values = ["mxf", "mov", "mp4"]
              }]

            }]
          },
          {
            name                          = "egsub-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-Bento4-Renaming-0026"
            service_bus_queue_endpoint_id = "/subscriptions/subs-******-******/resourceGroups/rg-xx77-dev-ci1-ve-0001/providers/Microsoft.ServiceBus/namespaces/sb-xx77-dev-ci1-ve-0001/queues/sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-bt_bento4_renaming-0037"

            advanced_filter = [{
              string_begins_with = [{
                key    = "subject"
                values = ["/blobServices/default/containers/xx77-transcoding/blobs/mp4/bento4_elemental/"]

              }]

            }]
          },
          {
            name                          = "egsub-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-xx77-content-stitching-0027"
            service_bus_queue_endpoint_id = "/subscriptions/subs-******-******/resourceGroups/rg-xx77-dev-ci1-ve-0001/providers/Microsoft.ServiceBus/namespaces/sb-xx77-dev-ci1-ve-0001/queues/sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-bt_xx77_content_stitching-0038"

            advanced_filter = [{
              string_begins_with = [{
                key    = "subject"
                values = ["/blobServices/default/containers/xx77-sourcefilesinput/"]
              }]

              string_ends_with = [{
                key    = "subject"
                values = ["csv"]
              }]

            }]
          },
        ]


        private_endpoint = {
          endpoint_name        = "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name_ve}0001-endpoint"
          subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
          connection_name      = "st${local.common.bu_name}${local.common.dep_env}ci1${local.common.app_name_ve}0001st-connection"
          private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/${local.common.resource_group_name_hubdns}/providers/Microsoft.Network/privateDnsZones/privatelink.eventgrid.azure.net"]
        }
      }

    }
  }
}
