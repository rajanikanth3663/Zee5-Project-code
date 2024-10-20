locals {
  configure_apim_resources = {
    settings = {

      "apim-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001" = {
        name                                          = "apim-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
        location                                      = "centralindia"
        resource_group_id                             = "/subscriptions/${local.subscription_id}/resourceGroups/rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
        resource_group_name                           = local.common.resource_group_name_csvc
        identity_type                                 = "SystemAssigned"
        properties_apiVersionConstraint_minApiVersion = "2019-12-01"
        properties_disableGateway                     = false
        properties_publisherEmail                     = "vc.suthan.ramakri1@xx77.com"
        properties_notificationSenderEmail            = "apimgmt-noreply@mail.windowsazure.com"
        properties_publisherName                      = "${local.common.bu_name}${local.common.app_name}${local.common.dep_env}"
        private_dns_zone_id                           = ["/subscriptions/${local.hub_subscription_id}/resourceGroups/rg-${local.common.bu_name}-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.azure-api.net"]
        properties_natGatewayState                    = "Disabled"
        properties_publicNetworkAccess                = "Enabled"
        properties_virtualNetworkType                 = "External"
        properties_virtualNetworkConfiguration = {
          # subnetResourceId = local.csvc_subnet_id["snet-${local.common.bu_name}-${local.common.dep_env}-ci1-apim-0001"]
          subnetResourceId = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-apim-0001"
        }
        properties_customProperties = {

          "Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Backend.Protocols.Ssl30"                      = "false"
          "Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Backend.Protocols.Tls10"                      = "false"
          "Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Backend.Protocols.Tls11"                      = "false"
          "Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Ciphers.TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA" = "false"
          "Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Ciphers.TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA" = "false"
          "Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Ciphers.TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA"   = "false"
          "Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Ciphers.TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA"   = "false"
          "Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Ciphers.TLS_RSA_WITH_AES_128_CBC_SHA"         = "false"
          "Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Ciphers.TLS_RSA_WITH_AES_128_CBC_SHA256"      = "false"
          "Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Ciphers.TLS_RSA_WITH_AES_128_GCM_SHA256"      = "false"
          "Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Ciphers.TLS_RSA_WITH_AES_256_CBC_SHA"         = "false"
          "Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Ciphers.TLS_RSA_WITH_AES_256_CBC_SHA256"      = "false"
          "Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Ciphers.TLS_RSA_WITH_AES_256_GCM_SHA384"      = "false"
          "Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Ciphers.TripleDes168"                         = "false"
          "Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Protocols.Ssl30"                              = "false"
          "Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Protocols.Tls10"                              = "false"
          "Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Protocols.Tls11"                              = "false"
        }
        sku = {
          name     = "Developer"
          capacity = 1
        }

        application_insights = {
          instrumentation_key = module.ai["appi-${local.common.bu_name}-${local.common.dep_env}-ci1-0001"].instrumentation_key
        }

        api_management_diagnostic = {
          sampling_percentage = 100
        }

      }
    }
  }
}
