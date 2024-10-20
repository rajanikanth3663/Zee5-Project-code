locals {
  configure_streamanalytic_job = {

    settings = {
      MetadataSolr_job1 = {
        name                                     = "MetadataSolrEnriched-Job"
        resource_group_name                      = local.common.resource_group_name_csvc
        location                                 = local.common.location
        compatibility_level                      = "1.2"
        data_locale                              = "en-GB"
        events_late_arrival_max_delay_in_seconds = 60
        events_out_of_order_max_delay_in_seconds = 50
        events_out_of_order_policy               = "Adjust"
        output_error_policy                      = "Drop"
        streaming_units                          = 3
        stream_analytics_cluster_id              = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.StreamAnalytics/clusters/stmacls-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
        transformation_query                     = <<QUERY
      SELECT
    id id,
	asset_type asset_type,
	udf.getAssetSubType(asset_type, asset_subtype) asset_subtype,
	title title,
    duration duration,
    sub_id sub_id,
    p_id p_id,
    (CASE WHEN (end_credits_start_s IS NOT NULL) THEN (duration - (((CAST(SUBSTRING(end_credits_start_s, 0, 2) AS BIGINT) * 3600) + (CAST(SUBSTRING(end_credits_start_s, 4, 2) AS BIGINT) * 60)) + CAST(SUBSTRING(end_credits_start_s, 7, 2) AS BIGINT))) WHEN (((end_credits_start_s IS NULL) AND (asset_type = 0)) AND (asset_subtype = 'movie')) THEN (duration - 120) WHEN (((end_credits_start_s IS NULL) AND (asset_type = 1)) AND (asset_subtype = 'episode')) THEN (duration - 60) ELSE duration END) end_credits_start_s,
    udf.getContentType(asset_type, genre, asset_subtype) content_type,
    udf.FlattenJson(genre) genre,
    tvshow_details.asset_subtype show_type,
    extended.content_version content_version,
    udf.FlattenJson(lang) lang,
    country_meta.us.business_type business_type
INTO
    [MetadataSolr]
FROM
    [ProcessMetadataHub]

SELECT
    id id,
	asset_type ASSET_TYPE,
	udf.getAssetSubType(asset_type, asset_subtype) ASSET_SUBTYPE,
	title TITLE,
	duration DURATION,
	(CASE WHEN (sub_id IS NULL) THEN id ELSE sub_id END) TVSHOW_ID_ASSET_ID,
	p_id P_ID,
	(CASE WHEN (end_credits_start_s IS NOT NULL) THEN (duration - (((CAST(SUBSTRING(end_credits_start_s, 0, 2) AS BIGINT) * 3600) + (CAST(SUBSTRING(end_credits_start_s, 4, 2) AS BIGINT) * 60)) + CAST(SUBSTRING(end_credits_start_s, 7, 2) AS BIGINT))) WHEN (((end_credits_start_s IS NULL) AND (asset_type = 0)) AND (asset_subtype = 'movie')) THEN (duration - 120) WHEN (((end_credits_start_s IS NULL) AND (asset_type = 1)) AND (asset_subtype = 'episode')) THEN (duration - 60) ELSE duration END) END_CREDITS_START,
	udf.getContentType(asset_type, genre, asset_subtype) CONTENT_TYPE,
	udf.FlattenJson(genre) GENRE,
	tvshow_details.asset_subtype SHOW_TYPE,
	extended.content_version CONTENT_VERSION,
	udf.FlattenJson(lang) LANG,
	country_meta.us.business_type BUSINESS_TYPE
INTO
    [MetadataSolrEncriched]
FROM
    [ProcessMetadataHub]
     QUERY

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
      WatchHistory_job2 = {
        name                                     = "PlaybackSessionEnriched-Job"
        resource_group_name                      = local.common.resource_group_name_csvc
        location                                 = local.common.location
        compatibility_level                      = "1.2"
        data_locale                              = "en-GB"
        events_late_arrival_max_delay_in_seconds = 60
        events_out_of_order_max_delay_in_seconds = 50
        events_out_of_order_policy               = "Adjust"
        output_error_policy                      = "Drop"
        streaming_units                          = 3
        stream_analytics_cluster_id              = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.StreamAnalytics/clusters/stmacls-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
        transformation_query                     = <<QUERY
            
  P.SESSION.SESSION_ID SESSION_ID,
  P.SESSION.LOADED_AT LOADED_AT,
  P.SESSION.METADATA.USER_ID USER_ID,
  P.SESSION.METADATA.DEVICE_ID DEVICE_ID,
  P.SESSION.METADATA.PROFILE_ID PROFILE_ID,
  P.SESSION.METADATA.USER_AGENT USER_AGENT,
  P.ASSET_ID ASSET_ID,
  P.EVENT.EVENT_TYPE EVENT_TYPE,
  P.EVENT.EMITTED_AT EMITTED_AT,
  P.LIVE_EVENT LIVE_EVENT,
  P.SESSION.METADATA.API_VERSION API_VERSION,
  P.SESSION.METADATA.IP_ADDRESS IP_ADDRESS,
  P.SESSION.METADATA.LATITUDE LATITUDE,
  P.SESSION.METADATA.LONGITUDE LONGITUDE,
  Q.ASSET_TYPE ASSET_TYPE,
  Q.ASSET_SUBTYPE ASSET_SUBTYPE,
  Q.END_CREDITS_START END_CREDITS_START,
  Q.TVSHOW_ID_ASSET_ID TVSHOW_ID_ASSET_ID,
  Q.TITLE TITLE,
  P.SESSION.METADATA.CURRENT_DURATION CURRENT_DURATION,
  Q.DURATION TOTAL_DURATION,
  Q.CONTENT_TYPE CONTENT_TYPE,
  P.ASSET_ID ID,
  Q.P_ID SEASON_ID,
  Q.GENRE GENRE,
  Q.SHOW_TYPE SHOW_TYPE,
  Q.CONTENT_VERSION CONTENT_VERSION,
  Q.LANG LANG,
  Q.BUSINESS_TYPE BUSINESS_TYPE
INTO
    [PLAYBACKSESSIONENRICHEDV2Hub]
FROM [PLAYBACKSESSIONV2Hub] P
INNER JOIN METADATAENRICHEDTABLE Q ON ((Q.ID = P.ASSET_ID))
WHERE (Q.row_num = 1)

--PART A
SELECT
  P.SESSION.SESSION_ID SESSION_ID, 
  P.SESSION.METADATA.USER_ID USER_ID, 
  P.SESSION.METADATA.DEVICE_ID DEVICE_ID, 
  P.ASSET_ID ASSET_ID, 
  P.ASSET_ID ASSETID,
  P.SESSION.METADATA.IP_ADDRESS IP_ADDRESS, 
  Q.TITLE TITLE 
INTO
    [USERSESSIONSTREAMHub]
FROM [PLAYBACKSESSIONV2Hub] P
INNER JOIN METADATAENRICHEDTABLE Q ON ((Q.ID = P.ASSET_ID))
WHERE (P.SESSION.METADATA.DEVICE_ID IS NOT NULL) AND (Q.row_num = 1)

--PART B
SELECT
  P.SESSION.SESSION_ID SESSION_ID, 
  P.SESSION.METADATA.USER_ID USER_ID,  
  P.SESSION.METADATA.DEVICE_ID DEVICE_ID, 
  P.SESSION.METADATA.PROFILE_ID PROFILE_ID, 
  P.ASSET_ID ASSET_ID, 
  Q.ASSET_TYPE ASSET_TYPE, 
  Q.ASSET_SUBTYPE ASSET_SUBTYPE, 
  Q.END_CREDITS_START END_CREDITS_START, 
  Q.TVSHOW_ID_ASSET_ID TVSHOW_ID_ASSET_ID, 
  P.SESSION.METADATA.CURRENT_DURATION CURRENT_DURATION, 
  Q.DURATION TOTAL_DURATION, 
  (Q.DURATION - P.SESSION.METADATA.CURRENT_DURATION) TIMELEFT, 
  ((P.SESSION.METADATA.CURRENT_DURATION * 100) / Q.DURATION) PERCENTAGE, 
  '20241101' LAST_UPDATED_TIME, -- TODO
  Q.CONTENT_TYPE CONTENT_TYPE, 
  0 ISDELETED,
  P.ASSET_ID ID
INTO
    [PLAYBACKWATCHHISTORYSTREAMHub]
FROM [PLAYBACKSESSIONV2Hub] P
INNER JOIN METADATAENRICHEDTABLE Q ON ((Q.ID = P.ASSET_ID))
WHERE (Q.row_num = 1)

--PART C
SELECT
  P.SESSION.METADATA.USER_ID USER_ID, 
  P.SESSION.METADATA.DEVICE_ID DEVICE_ID,
  P.ASSET_ID ASSET_ID, 
  P.ASSET_ID ID
INTO
    [TVODFIRSTPLAYHub]
FROM [PLAYBACKSESSIONV2Hub] P
INNER JOIN METADATAENRICHEDTABLE Q ON ((Q.ID = P.ASSET_ID))
WHERE ((LOWER(Q.BUSINESS_TYPE) LIKE '%tvod%') AND (P.SESSION.METADATA.CURRENT_DURATION < 60)) AND (Q.row_num = 1)
           QUERY

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
