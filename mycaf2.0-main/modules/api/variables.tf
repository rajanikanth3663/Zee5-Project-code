variable "settings" {
  description = "API configuration."
  type = object({
    resource_group_name   = string
    api_management_name   = string
    api_name              = string
    revision              = string
    display_name          = string
    protocols             = list(string)
    service_url           = string
    path                  = optional(string)
    subscription_required = bool
    subscription_key_parameter_names = optional(map(string),
      {
        header = "Ocp-Apim-Subscription"
        query  = "subscription-key"
      }
    )
    description = optional(string)

    endpoints = list(object({
      endpoint_name = string
      display_name  = string
      method        = string
      url_template  = string
      template_parameter = list(object({
        name     = string
        type     = string
        required = bool
      }))
      query_parameter = optional(list(object({
        name     = string
        type     = string
        required = bool
      })))
      response = optional(list(object({
        status_code = number
        representation = optional(list(object({
          content_type = string
          example = optional(list(object({
            name        = string
            stringvalue = optional(map(string))
            listvalue   = optional(map(list(string)))
            # examplevalue = map(object({
            #   ok                 = optional(string, null)
            #   audioLanguage      = optional(string, null)
            #   subtitleLanguages  = optional(string, null)
            #   dashRootFolderName = optional(string, null)
            #   dashManifestName   = optional(string, null)
            #   hlsRootFolderName  = optional(string, null)
            #   hlsManifestName    = optional(string, null)
            #   drmKeyId           = optional(string, null)
            #   content_duration   = optional(number, null)
            #   size               = optional(number, null)
            #   dashSuffixesId     = optional(list(string), null)
            #   hlsSuffixesId      = optional(list(string), null)
            #   sprite             = optional(string, null)
            #   subtitle_manifest  = optional(bool, null)
            #   thumbnails         = optional(string, null)
            #   drmResourceId      = optional(string, null)
            #   #audioformatid          = optional(list(string), null)
            #   #videoformatid          = optional(list(string), null)
            #   mssRootFolderName = optional(string, null)
            #   mssManifestName   = optional(string, null)
            #   sticker_url       = optional(string, null)
            #   drm4kKeyId        = optional(string, null)
            #   #mssSuffixesId          = optional(list(string), null)
            #   #hls_manifest           = optional(list(string), null)
            #   #dash_manifest          = optional(list(string), null)
            #   content_audio_language = optional(string, null)
            #   dash_drm_url           = optional(string, null)
            #   hls_drm_url            = optional(string, null)
            #   dash_key_id            = optional(string, null)
            #   mss_drm_url            = optional(string, null)
            #   mp4_url                = optional(string, null)
            #   mss_manifest           = optional(string, null)
            # }))
          })))
        })))

      })))
    }))

    api_operation_policy = optional(list(object({
      api_name     = string
      operation_id = string
      xml_content  = string
    })))

    api_policy = optional(list(object({
      api_name    = string
      xml_content = string
    })))
    product = optional(list(object({
      product_id = string
    })))
  })
}
