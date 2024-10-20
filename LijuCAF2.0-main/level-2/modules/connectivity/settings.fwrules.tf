locals {
  configure_fwrules = {
    settings = {
      hubfirewallrules = {
        name               = "fwpolicy-rule-collections"
        firewall_policy_id = { for afwp in "${module.caf_level2.azurerm_firewall_policy.connectivity}" : "id" => afwp.id }.id
        priority           = 100

        network_rule_collection = {
          name     = "network_rule_collection"
          priority = 200
          action   = "Allow"

          rules = [{
            name                  = "APIM SQL Rule"
            protocols             = ["TCP"]
            source_addresses      = ["*"]
            destination_addresses = ["Sql"]
            destination_ports     = ["1433"]
            }, {
            name                  = "APIM Storage Rule"
            protocols             = ["TCP"]
            source_addresses      = ["*"]
            destination_addresses = ["Storage"]
            destination_ports     = ["443"]
            }, {
            name                  = "APIM KeyVault Rule"
            protocols             = ["TCP"]
            source_addresses      = ["*"]
            destination_addresses = ["AzureKeyVault"]
            destination_ports     = ["443"]
            }, {
            name                  = "APIM Rule"
            protocols             = ["TCP"]
            source_addresses      = ["*"]
            destination_addresses = ["ApiManagement"]
            destination_ports     = ["3443"]
            }, {
            name                  = "APIM Monitor Rule"
            protocols             = ["TCP"]
            source_addresses      = ["*"]
            destination_addresses = ["AzureMonitor"]
            destination_ports     = ["443", "445", "80", "1886"]
            }, {
            name                  = "APIM Monitor Rule 2"
            protocols             = ["TCP", "UDP"]
            source_addresses      = ["*"]
            destination_addresses = ["*"]
            destination_ports     = ["1886"]
            }, {
            name                  = "apidup"
            protocols             = ["Any"]
            source_addresses      = ["*"]
            destination_addresses = ["AzureCloud.centralindia"]
            destination_ports     = ["1194", "9000"]
            },
            {
              name              = "AKS-TIME"
              protocols         = ["Any"]
              source_addresses  = ["*"]
              destination_fqdns = ["ntp.ubuntu.com"]
              destination_ports = ["123"]
            },
            {
              name             = "github"
              protocols        = ["Any"]
              source_addresses = ["*"]
              destination_fqdns = ["github.com",
                "githubusercontent.com",
              "pipelines.actions.githubusercontent.com"]
              destination_ports = ["443", "80"]
            },
            {
              name                  = "ateme_inbound_srt_rtmp"
              protocols             = ["Any", "TCP", "UDP", "ICMP"]
              source_addresses      = ["125.22.14.217", "15.206.97.54"]
              destination_addresses = ["10.172.117.64"]
              destination_ports     = ["30001-30030"]
          }]
        }

        application_rule_collection = {
          name     = "app_rule_collection"
          priority = 310
          action   = "Allow"

          rules = [{
            name = "Azure and MS websites"
            protocols = [{
              type = "Http"
              port = 80
              }, {
              type = "Https"
              port = 443
            }]
            source_addresses = ["*"]
            destination_fqdns = [
              "mcr.microsoft.com",
              "*.data.mcr.microsoft.com",
              "management.azure.com",
              "login.microsoftonline.com",
              "acs-mirror.azureedge.net",
              "*.opinsights.azure.com",
              "*.oms.opinsights.azure.com",
              "*.microsoftonline.com",
              "*.monitoring.azure.com",
              "ghcr.io",
              "pkg-containers.githubusercontent.com",
              "*.login.microsoft.com",
              "login.windows.net",
              "*.repmap.microsoft.com",
              "*.microsoft.com",
              "*.ubuntu.com",
              "downloads.apache.org",
              "*.scylladb.com",
              "*.registry.access.redhat.com",
              "*.registry.access.redhat.com",
              "github.com",
              "*.githubusercontent.com",
              "*.hashicorp.com",
              "*.terraform.io",
              "*.googleapis.com",
              "downloads.mongodb.com",
              "*.docker.com",
            ]
            }, {
            name = "AKS"
            protocols = [{
              type = "Http"
              port = 80
              }, {
              type = "Https"
              port = 443
            }]
            source_addresses      = ["*"]
            destination_fqdn_tags = ["AzureKubernetesService"]
            },

            {
              name = "CommonSites"
              protocols = [{
                type = "Http"
                port = 80
                }, {
                type = "Https"
                port = 443
              }]
              source_addresses = ["*"]
              destination_fqdns = [
                "mcr.microsoft.com",
                "*.data.mcr.microsoft.com",
                "management.azure.com",
                "login.microsoftonline.com",
                "acsmirror.azureedge.net",
                "*.opinsights.azure.com",
                "*.oms.opinsights.azure.com",
                "*.microsoftonline.com",
                "*.monitoring.azure.com",
                "ghcr.io",
                "pkgcontainers.githubusercontent.com",
                "*.login.microsoft.com",
                "login.windows.net",
                "*.repmap.microsoft.com",
                "*.microsoft.com",
                "*.ubuntu.com",
                "downloads.apache.org",
                "*.scylladb.com",
                "*.github.com",
                "*.digicert.com",
                "*.trafficmanager.net",
                "*.mongodb.org",
                "docker.io",
                "*.npmjs.org",
                "*.python.org",
                "*.bootstrap.pypa.io",
                "*.pypi.org",
                "*.pypi.python.org",
                "*.pythonhosted.org",
                "pypi.org",
                "*.quay.io",
                "*.redhat.com",
                "*.ateme.net",
                "*.azure.com",
                "*.registry.access.redhat.com",
                "github.com"
              ]
            },


            {
              name = "Ateme rules"
              protocols = [{
                type = "Http"
                port = 80
                }, {
                type = "Https"
                port = 443
              }]
              source_addresses = ["10.172.112.0/20"]
              destination_fqdn_tags = [
                "ott007av6u-op.anycast.nagra.com",
                "*.data.mcr.microsoft.com",
                "management.azure.com",
                "login.microsoftonline.com",
                "acsmirror.azureedge.net",
                "*.opinsights.azure.com",
                "*.oms.opinsights.azure.com",
                "*.microsoftonline.com",
                "*.monitoring.azure.com",
                "ghcr.io",
                "pkgcontainers.githubusercontent.com",
                "*.login.microsoft.com",
                "login.windows.net",
                "*.repmap.microsoft.com",
                "*.microsoft.com",
                "*.ubuntu.com",
                "downloads.apache.org",
                "*.scylladb.com",
                "*.github.com",
                "*.digicert.com",
                "*.trafficmanager.net"
              ]
          }]
        }

        nat_rule_collection = {
          name     = "dnat_rule_collection"
          priority = 100
          action   = "Dnat"

          rules = [
            # {
            #   name      = "fwrule-dnat"
            #   protocols = ["TCP", "UDP"]
            #   source_addresses = [
            #     "103.195.70.204",
            #     "116.15.227.165",
            #     "159.196.162.20",
            #     "110.145.78.131",
            #     "35.244.59.235"
            #   ]
            #   destination_address = "20.204.235.9"
            #   destination_ports   = ["8080"]
            #   translated_address  = "10.171.42.206"
            #   translated_port     = "8080"

            # },
            {
              name      = "ATEME_SRT_30001"
              protocols = ["TCP", "UDP"]
              source_addresses = [
                "34.87.75.29"
              ]
              destination_address = "20.204.235.9"
              destination_ports   = ["30001"]
              translated_address  = "10.172.117.64"
              translated_port     = "30001"

            },
            {
              name      = "ATEME_SRT_30003"
              protocols = ["TCP", "UDP"]
              source_addresses = [
                "125.22.14.217"
              ]
              destination_address = "20.204.235.9"
              destination_ports   = ["30003"]
              translated_address  = "10.172.117.64"
              translated_port     = "30003"

            },
            {
              name      = "ATEME_RTP_30004"
              protocols = ["TCP", "UDP"]
              source_addresses = [
                "15.206.97.54"
              ]
              destination_address = "20.204.235.9"
              destination_ports   = ["30004"]
              translated_address  = "10.172.117.64"
              translated_port     = "30004"

            },
            {
              name      = "ATEME_RTMP_30011"
              protocols = ["TCP", "UDP"]
              source_addresses = [
                "125.22.14.209"
              ]
              destination_address = "20.204.235.9"
              destination_ports   = ["30011"]
              translated_address  = "10.172.117.64"
              translated_port     = "30011"

            }
          ]
        }
      }
    }
  }
}
