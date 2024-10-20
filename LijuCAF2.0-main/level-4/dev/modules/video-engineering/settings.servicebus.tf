locals {
  configure_servicebus_resources = {
    settings = {
      sb-ott007-dev-ci1-ve-0001 = {
        location            = "centralindia"
        resource_group_name = "rg-ott007-dev-ci1-ve-0001"
        name                = "sb-ott007-dev-ci1-ve-0001"
        sku                 = "Premium"
        local_auth_enabled  = true
        minimum_tls_version = "1.2"
        zone_redundant      = false
        capacity            = 1

        private_endpoint = {
          endpoint_name        = "pep-ott007-dev-ci1-ve-0001"
          subnet_id            = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-app-0007"
          connection_name      = "sb-ott007-dev-ci1-ve-0001-pvt-connection"
          private_dns_zone_ids = ["/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.servicebus.windows.net"]
        }

        servicebus_queue = [
          {
            name = "sbq-ott007-dev-ci1-ve-toch_handeling-0001"
          },
          {
            name = "sbq-ott007-dev-ci1-ve-transcoding_blob_to_sb-0002"
          },
          {
            name = "sbq-ott007-dev-ci1-ve-transcoding_job_creator-0003"
          },
          {
            name = "sbq-ott007-dev-ci1-ve-aston_bumper-0004"
          },
          {
            name = "sbq-ott007-dev-ci1-ve-stitching_function-0005"
          },
          {
            name = "sbq-ott007-dev-ci1-ve-image_refresh_api-0006"
          },
          {
            name = "sbq-ott007-dev-ci1-ve-transcoding_accelerated-0007"
          },
          {
            name = "sbq-ott007-dev-ci1-ve-ott007_news_blob_sync-0008"
          },
          {
            name = "sbq-ott007-dev-ci1-ve-blob_to_sb_queue-0009"
          },
          {
            name = "sbq-ott007-dev-ci1-ve-copy_script_stitching-0010"
          },
          {
            name = "sbq-ott007-dev-ci1-ve-manifest_rename-0011"
            }, {
            name = "sbq-ott007-dev-ci1-ve-post_transcoding_processing-0012"
          },
          {
            name = "sbq-ott007-dev-ci1-ve-metadata_handler-0013"
          },
          {
            name = "sbq-ott007-dev-ci1-ve-transcoding_dash_manifest_modification-0014"
          },
          {
            name = "sbq-ott007-dev-ci1-ve-append_trancoded_url_to_rss_feed-0015"
          },
          {
            name = "sbq-ott007-dev-ci1-ve-daily_shorts_subtitle_creator-0016"
          },
          {
            name             = "sbq-ott007-dev-ci1-ve-transcoding-kids.fifo-0017"
            requires_session = true
          },
          {
            name             = "sbq-ott007-dev-ci1-ve-transcoding-movies.fifo-0018"
            requires_session = true
          },
          {
            name             = "sbq-ott007-dev-ci1-ve-transcoding-music_videos.fifo-0019"
            requires_session = true
          },
          {
            name             = "sbq-ott007-dev-ci1-ve-transcoding-news.fifo-0020"
            requires_session = true
          },
          {
            name             = "sbq-ott007-dev-ci1-ve-transcoding-originals.fifo-0021"
            requires_session = true
          },
          {
            name             = "sbq-ott007-dev-ci1-ve-transcoding-trailers.fifo-0022"
            requires_session = true
          },
          {
            name             = "sbq-ott007-dev-ci1-ve-transcoding-tv_shows.fifo-0023"
            requires_session = true
            }, {
            name = "sbq-ott007-dev-ci1-ve-webisode-1-0024"
          },
          {
            name             = "sbq-ott007-dev-ci1-ve-sports_vod_notifier.fifo-0025"
            requires_session = true
          },
          {
            name             = "sbq-ott007-dev-ci1-ve-bento4_packaging2.fifo-0026"
            requires_session = true
          },
          {
            name             = "sbq-ott007-dev-ci1-ve-bento4_packaging_prod.fifo-0027"
            requires_session = true
          },
          {
            name = "sbq-ott007-dev-ci1-ve-ott007_content_stitching-0028"
          },
          {
            name             = "sbq-ott007-dev-ci1-ve-webisode-4.fifo-0029"
            requires_session = true
          },
          {
            name = "sbq-ott007-dev-ci1-ve-ott007_content_stitching_intermediate-0030"
          },
          {
            name = "sbq-ott007-dev-ci1-ve-ott007_content_stitching_output-0031"
          },
          {
            name             = "sbq-ott007-dev-ci1-ve-Blob_Cleanup.fifo-0032"
            requires_session = true
          },
          {
            name             = "sbq-ott007-dev-ci1-ve-Clips_mp4_download.fifo-0033"
            requires_session = true
          },
          {
            name = "sbq-ott007-dev-ci1-ve-copy_transcoded_output_clips-0034"
          },






          {
            name = "sbq-ott007-dev-ci1-ve-bt_hls_subtitle_addition-0035"
          },
          {
            name = "sbq-ott007-dev-ci1-ve-bt_retranscoding_newbitrate_blobtosb-0036"
          },
          {
            name = "sbq-ott007-dev-ci1-ve-bt_bt_bento4_renaming-0037"
          },
          {
            name = "sbq-ott007-dev-ci1-ve-bt_bt_ott007_content_stitching-0038"
          },
          {
            name = "sbq-ott007-dev-ci1-ve-inv_retranscoding_newbitrate_sbtoateme-0039"
          },
          {
            name = "sbq-ott007-dev-ci1-ve-bt_inv_news_vod_rss_db-0040"
          },
          {
            name             = "sbq-ott007-dev-ci1-ve-ReTranscoding_NewBitrate.fifo-0041"
            requires_session = true
          },
          {
            name             = "sbq-ott007-dev-ci1-ve-InHouseTranscoder_InputQ.fifo-0042"
            requires_session = true
          },
          {
            name             = "sbq-ott007-dev-ci1-ve-InHouseTranscoder_AggregatorQ.fifo-0042"
            requires_session = true
          },
          {
            name             = "sbq-ott007-dev-ci1-ve-InHouseTranscoder_AdContentQ.fifo-0043"
            requires_session = true
          },
          {
            name = "sbq-ott007-dev-ci1-ve-codeSNS-0044"

          },
          {
            name = "sbq-ott007-dev-ci1-ve-transcoding_processing-0045"

          },
          {
            name = "sbq-ott007-dev-ci1-ve-Lease_Line_Email_Alert-0046"

          }






        ]
      }

    }
  }
}
