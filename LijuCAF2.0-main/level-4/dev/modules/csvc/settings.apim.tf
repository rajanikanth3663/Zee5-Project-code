locals {
  configure_apim = {
    settings = {
      name                                          = "apim-ott007-dev-ci1-csss-0001"
      location                                      = "centralindia"
      resource_group_id                             = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001"
      resource_group_name                           = "rg-ott007-dev-ci1-csss-0001"
      identity_type                                 = "SystemAssigned"
      properties_apiVersionConstraint_minApiVersion = "2019-12-01"
      properties_disableGateway                     = false
      properties_publisherEmail                     = "vc.suthan.ramakri1@ott.com"
      properties_notificationSenderEmail            = "apimgmt-noreply@mail.windowsazure.com"
      properties_publisherName                      = "ott007csssdev"
      #private_ep_subnet_id                          = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-apim-0001"
      #private_ep_name                               = "pep-ott007-dev-ci1-csssapim-0001"
      private_dns_zone_id            = ["/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.azure-api.net"]
      properties_natGatewayState     = "Disabled"
      properties_publicNetworkAccess = "Enabled"
      properties_virtualNetworkType  = "External"
      properties_virtualNetworkConfiguration = {
        subnetResourceId = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-apim-0001"
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

    }
  }
}