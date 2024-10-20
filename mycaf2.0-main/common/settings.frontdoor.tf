locals {
  configure_frontdoor_configurations_resources = {
    settings = {
      afd-xx77-np-hub-0001 = {
        cdn_frontdoor_profile_id = "/subscriptions/subs-******-*****/resourceGroups/rg-xx77-np-ci1-hubconnectivity-0001/providers/Microsoft.Cdn/profiles/afd-xx77-np-hub-0001"


        endpoints = [
          {
            name    = "apim-dev"
            enabled = true
          },
        ]

        origin_groups = [
          {
            name = "APIM-Dev"

            health_probe = {
              interval_in_seconds = 100
              path                = "/"
              protocol            = "Http"
              request_type        = "HEAD"
            }

            load_balancing = {
              additional_latency_in_milliseconds = 50
              sample_size                        = 4
              successful_samples_required        = 3
            }
          }
        ]

        # create origins after origins group
        origins = [
          {
            name                           = "APIM-Dev"
            origin_group_name              = "APIM-Dev"
            enabled                        = true
            certificate_name_check_enabled = true
            host_name                      = "apim-xx77-dev-ci1-csvc-0001.azure-api.net"
            http_port                      = 80
            https_port                     = 443
            origin_host_header             = "apim-xx77-dev-ci1-csvc-0001.azure-api.net"
            priority                       = 1
            weight                         = 1000

          },
        ]

        custom_domains = [

          {
            name        = "apim-dev-azott-in"
            host_name   = "apim-dev.azott.in"
            dns_zone_id = "/subscriptions/0bb777e9-f492-4d74-b0fc-77f0d0f381ed/resourceGroups/rg-xx77digital-np-ci1-hubdns-0001/providers/Microsoft.Network/dnsZones/azott.in"
            tls = {
              certificate_type      = "CustomerCertificate"
              frontdoor_secret_name = "kv-xx77-np-ci1-hub-0001-wildcardazottinpfx-latest"

            }
          },
        ]



        routes = [

          {
            name                          = "APim-Dev-Route"
            frontdoor_endpoint_name       = "apim-dev"
            frontdoor_origin_group_name   = "APIM-Dev"
            frontdoor_custom_domain_names = ["apim-dev-azott-in"]
            cdn_frontdoor_rule_set_ids = [
              "/subscriptions/subs-******-*****/resourceGroups/rg-xx77-np-ci1-hubconnectivity-0001/providers/Microsoft.Cdn/profiles/afd-xx77-np-hub-0001/ruleSets/uapirule",
            ]
            enabled                = true
            forwarding_protocol    = "MatchRequest"
            patterns_to_match      = ["/*"]
            supported_protocols    = ["Http", "Https"]
            https_redirect_enabled = true
            link_to_default_domain = false
          },
        ]
      }
    }
  }
}
