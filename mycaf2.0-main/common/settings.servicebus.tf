locals {
  configure_servicebus_resources = {
    settings = {
      "sb-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-0001" = {
        location            = local.common.location
        resource_group_name = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-0001"
        name                = "sb-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-0001"
        sku                 = "Premium"
        local_auth_enabled  = true
        minimum_tls_version = "1.2"
        zone_redundant      = false
        capacity            = 1

        private_endpoint = {
          endpoint_name        = "pep-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-0001"
          subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
          connection_name      = "sb-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-0001-pvt-connection"
          private_dns_zone_ids = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/${local.common.resource_group_name_hubdns}/providers/Microsoft.Network/privateDnsZones/privatelink.servicebus.windows.net"]
        }

        servicebus_queue = [
          {
            name = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-toch_handeling-0001"
          },
          {
            name = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-transcoding_blob_to_sb-0002"
          },
          {
            name = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-transcoding_job_creator-0003"
          },
          {
            name = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-aston_bumper-0004"
          },
          {
            name = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-stitching_function-0005"
          },
          {
            name = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-image_refresh_api-0006"
          },
          {
            name = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-transcoding_accelerated-0007"
          },
          {
            name = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-xx77_news_blob_sync-0008"
          },
          {
            name = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-blob_to_sb_queue-0009"
          },
          {
            name = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-copy_script_stitching-0010"
          },
          {
            name = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-manifest_rename-0011"
            }, {
            name = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-post_transcoding_processing-0012"
          },
          {
            name = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-metadata_handler-0013"
          },
          {
            name = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-transcoding_dash_manifest_modification-0014"
          },
          {
            name = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-append_trancoded_url_to_rss_feed-0015"
          },
          {
            name = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-daily_shorts_subtitle_creator-0016"
          },
          {
            name             = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-transcoding-kids.fifo-0017"
            requires_session = true
          },
          {
            name             = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-transcoding-movies.fifo-0018"
            requires_session = true
          },
          {
            name             = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-transcoding-music_videos.fifo-0019"
            requires_session = true
          },
          {
            name             = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-transcoding-news.fifo-0020"
            requires_session = true
          },
          {
            name             = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-transcoding-originals.fifo-0021"
            requires_session = true
          },
          {
            name             = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-transcoding-trailers.fifo-0022"
            requires_session = true
          },
          {
            name             = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-transcoding-tv_shows.fifo-0023"
            requires_session = true
            }, {
            name = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-webisode-1-0024"
          },
          {
            name             = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-sports_vod_notifier.fifo-0025"
            requires_session = true
          },
          {
            name             = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-bento4_packaging2.fifo-0026"
            requires_session = true
          },
          {
            name             = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-bento4_packaging_prod.fifo-0027"
            requires_session = true
          },
          {
            name = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-xx77_content_stitching-0028"
          },
          {
            name             = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-webisode-4.fifo-0029"
            requires_session = true
          },
          {
            name = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-xx77_content_stitching_intermediate-0030"
          },
          {
            name = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-xx77_content_stitching_output-0031"
          },
          {
            name             = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-Blob_Cleanup.fifo-0032"
            requires_session = true
          },
          {
            name             = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-Clips_mp4_download.fifo-0033"
            requires_session = true
          },
          {
            name = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-copy_transcoded_output_clips-0034"
          },






          {
            name = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-bt_hls_subtitle_addition-0035"
          },
          {
            name = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-bt_retranscoding_newbitrate_blobtosb-0036"
          },
          {
            name = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-bt_bento4_renaming-0037"
          },
          {
            name = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-bt_xx77_content_stitching-0038"
          },
          {
            name = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-inv_retranscoding_newbitrate_sbtoateme-0039"
          },
          {
            name = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-bt_inv_news_vod_rss_db-0040"
          },
          {
            name             = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-ReTranscoding_NewBitrate.fifo-0041"
            requires_session = true
          },
          {
            name             = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-InHouseTranscoder_InputQ.fifo-0042"
            requires_session = true
          },
          {
            name             = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-InHouseTranscoder_AggregatorQ.fifo-0042"
            requires_session = true
          },
          {
            name             = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-InHouseTranscoder_AdContentQ.fifo-0043"
            requires_session = true
          },
          {
            name = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-codeSNS-0044"

          },
          {
            name = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-transcoding_processing-0045"

          },
          {
            name = "sbq-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_ve}-Lease_Line_Email_Alert-0046"

          }
        ]
      }

    }
  }
}
