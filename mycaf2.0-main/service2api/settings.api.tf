locals {
  configure_api_resources = {
    settings = {
      CMS-Rabab-services = {
        resource_group_name   = "rg-zee5-uat-ci1-csvc-0001"
        api_management_name   = "apim-zee5-uat-ci1-csvc-0001"
        api_name              = "cmsservice"
        revision              = "1"
        display_name          = "CMS Rabab services"
        protocols             = ["https"]
        service_url           = "https://cms-rabab-uat.azzeeinternal.in"
        path                  = "cms"
        subscription_required = false
        subscription_key_parameter_names = {
          header = "Ocp-Apim-Subscription-Key"
          query  = "subscription-key"
        }

        endpoints = [
          {
            endpoint_name      = "api-docs"
            display_name       = "Api-docs"
            method             = "GET"
            url_template       = "/api-docs"
            template_parameter = []
          },
          {
            endpoint_name      = "bulk-delete"
            display_name       = "bulk-delete"
            method             = "DELETE"
            url_template       = "/bulkops/api/*"
            template_parameter = []
          },
          {
            endpoint_name      = "bulk"
            display_name       = "bulk-get"
            method             = "GET"
            url_template       = "/bulkops/api/*"
            template_parameter = []
          },
          {
            endpoint_name      = "bulk-patch"
            display_name       = "bulk-patch"
            method             = "PATCH"
            url_template       = "/bulkops/api/*"
            template_parameter = []
          },
          {
            endpoint_name      = "bulk-post"
            display_name       = "bulk-post"
            method             = "POST"
            url_template       = "/bulkops/api/*"
            template_parameter = []
          },
          {
            endpoint_name      = "bulk-put"
            display_name       = "bulk-put"
            method             = "PUT"
            url_template       = "/bulkops/api/*"
            template_parameter = []
          },
          {
            endpoint_name      = "express-api-delete"
            display_name       = "express-api-delete"
            method             = "DELETE"
            url_template       = "/api/*"
            template_parameter = []
          },
          {
            endpoint_name      = "express-api"
            display_name       = "express-api-get"
            method             = "GET"
            url_template       = "/api/*"
            template_parameter = []
          },
          {
            endpoint_name      = "express-api-health"
            display_name       = "express-api-health"
            method             = "GET"
            url_template       = "/health-check"
            template_parameter = []
          },
          {
            endpoint_name      = "express-api-patch"
            display_name       = "express-api-patch"
            method             = "PATCH"
            url_template       = "/api/*"
            template_parameter = []
          },
          {
            endpoint_name      = "express-api-post"
            display_name       = "express-api-post"
            method             = "POST"
            url_template       = "/api/*"
            template_parameter = []
          },
          {
            endpoint_name      = "express-api-put"
            display_name       = "express-api-put"
            method             = "PUT"
            url_template       = "/api/*"
            template_parameter = []
          }
        ]

        api_policy = [{
          api_name    = "cmsservice"
          xml_content = <<XML
       <!--
    IMPORTANT:
    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.
    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.
    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.
    - To add a policy, place the cursor at the desired insertion point and select a policy from the sidebar.
    - To remove a policy, delete the corresponding policy statement from the policy document.
    - Position the <base> element within a section element to inherit all policies from the corresponding section element in the enclosing scope.
    - Remove the <base> element to prevent inheriting policies from the corresponding section element in the enclosing scope.
    - Policies are applied in the order of their appearance, from the top down.
    - Comments within policy elements are not supported and may disappear. Place your comments between policy elements or at a higher level scope.
-->
<policies>
    <inbound>
        <cors>
            <allowed-origins>
                <origin>*</origin>
            </allowed-origins>
            <allowed-methods preflight-result-max-age="300">
                <method>GET</method>
                <method>POST</method>
                <method>PUT</method>
                <method>PATCH</method>
                <method>DELETE</method>
            </allowed-methods>
            <allowed-headers>
                <header>*</header>
            </allowed-headers>
            <expose-headers>
                <header>*</header>
            </expose-headers>
        </cors>
        <set-backend-service base-url="http://cms-rabab-uat.azzeeinternal.in" />
    </inbound>
    <backend>
        <forward-request timeout="300" />
    </backend>
    <outbound>
        <base />
    </outbound>
    <on-error>
        <base />
    </on-error>
</policies>
        XML
        }]
      }



      CmsExtMediaThek = {
        resource_group_name   = "rg-zee5-uat-ci1-csvc-0001"
        api_management_name   = "apim-zee5-uat-ci1-csvc-0001"
        api_name              = "CmsExtMediaThek"
        revision              = "1"
        display_name          = "CmsExtMediaThek"
        protocols             = ["https"]
        service_url           = "https://apim-uat.azott.in/extmediathek"
        path                  = "extmediathek"
        subscription_required = false
        subscription_key_parameter_names = {
          header = "Ocp-Apim-Subscription-Key"
          query  = "subscription-key"
        }

        api_policy = [{
          api_name    = "CmsExtMediaThek"
          xml_content = <<XML
       <!--
    IMPORTANT:
    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.
    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.
    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.
    - To add a policy, place the cursor at the desired insertion point and select a policy from the sidebar.
    - To remove a policy, delete the corresponding policy statement from the policy document.
    - Position the <base> element within a section element to inherit all policies from the corresponding section element in the enclosing scope.
    - Remove the <base> element to prevent inheriting policies from the corresponding section element in the enclosing scope.
    - Policies are applied in the order of their appearance, from the top down.
    - Comments within policy elements are not supported and may disappear. Place your comments between policy elements or at a higher level scope.
-->
<policies>
    <inbound>
        <base />
    </inbound>
    <backend>
        <base />
    </backend>
    <outbound>
        <base />
    </outbound>
    <on-error>
        <base />
    </on-error>
</policies>
        XML
        }]


        endpoints = [
          {
            endpoint_name      = "medathekextpost"
            display_name       = "MedathekExtPost"
            method             = "POST"
            url_template       = "/*"
            template_parameter = []
            response = [
              {
                status_code = 200
                representation = [{
                  content_type = "application/json"
                  example = [{
                    name = "default"

                    stringvalue = {
                      ok = "updated"
                    }
                    examplevalue = {
                      objectvalues = {
                        ok = "updated"
                      }
                    }
                  }]
                }]
              }
            ]
          }
        ]
      }
      CmsMediThek = {
        resource_group_name   = "rg-zee5-uat-ci1-csvc-0001"
        api_management_name   = "apim-zee5-uat-ci1-csvc-0001"
        api_name              = "CmsMediThek"
        revision              = "1"
        display_name          = "CmsMediThek"
        protocols             = ["https"]
        service_url           = "https://apim-qa.azott.in/mediathek"
        path                  = "mediathek"
        subscription_required = false
        subscription_key_parameter_names = {
          header = "Ocp-Apim-Subscription-Key"
          query  = "subscription-key"
        }
        endpoints = [
          {
            endpoint_name      = "mediathekget"
            display_name       = "MediathekGET"
            method             = "GET"
            url_template       = "/*"
            template_parameter = []
            response = [
              {
                status_code = 200
                representation = [{
                  content_type = "application/json"
                  example = [{
                    name = "default"
                    stringvalue = {
                      audioLanguage          = "te"
                      subtitleLanguages      = "English"
                      dashRootFolderName     = "/drm1/1080p/movies/MOVIE_PROJECT/MALAYALAM/test123.mp4"
                      dashManifestName       = "manifest.mpd"
                      hlsRootFolderName      = "/drm1/1080p/movies/MOVIE_PROJECT/MALAYALAM/test123.mp4"
                      hlsManifestName        = "index.m3u8"
                      drmKeyId               = "eb914881-d237-46c6-b5d0-f664235f2d48"
                      content_duration       = 10
                      size                   = "5"
                      sprite                 = "https://zee5vod.akamaized.net/drm1/1080p/movies/MOVIE_PROJECT/MALAYALAM/test123.mp4/thumbnails/sprite.jpg"
                      subtitle_manifest      = false
                      thumbnails             = "https://mediacloudfront.zee5.com/thumbnail/test123/index.vtt"
                      drmResourceId          = "eb914881-d237-46c6-b5d0-f664235f2d48"
                      mssRootFolderName      = ""
                      mssManifestName        = ""
                      sticker_url            = "https://media.axprod.net/TestVectors/v7-MultiDRM-SingleKey/Manifest_1080p.mpd"
                      drm4kKeyId             = "test12334key"
                      content_audio_language = "Telugu"
                      dash_drm_url           = "https://media.axprod.net/TestVectors/v7-MultiDRM-SingleKey/Manifest_1080p.mpd"
                      hls_drm_url            = "https://media.axprod.net/TestVectors/v7-MultiDR/Manifest_1080p.mpd"
                      dash_key_id            = "testid"
                      mss_drm_url            = "https://media.axprod.net/TestVectors/v7-MultiDRM-SingleKey/Manifest_1080p.mpd"
                      mp4_url                = "http://test.test.net"
                      mss_manifest           = ""
                    }

                    listvalue = {
                      dashSuffixesId = ["7vyfgyu"]
                      hlsSuffixesId  = ["hdgu875"]
                      audioformatid  = ["720p"]
                      videoformatid  = ["720p"]
                      mssSuffixesId  = ["jhuey7"]
                      hls_manifest   = ["test.m3u8"]
                      dash_manifest  = ["test.m3u8"]
                    }
                  }]
                }]
              }
            ]
          }
        ]
      }
    }
  }
}
