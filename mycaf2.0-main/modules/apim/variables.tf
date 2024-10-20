variable "settings" {
  type = object({
    name              = string
    location          = string
    resource_group_id = string
    tags              = optional(map(string), null)
    identity_type     = string
    identity_ids      = optional(list(string))

    application_insights = object({
      instrumentation_key = string
    })

    api_management_diagnostic = optional(object({
      sampling_percentage = number
    }))

    properties_additionalLocations = optional(list(object({
      disableGateway                               = bool
      location                                     = string
      natGatewayState                              = string
      publicIpAddressId                            = string
      sku_capacity                                 = number
      sku_name                                     = string
      virtualNetworkConfiguration_subnetResourceId = string
      zones                                        = optional(list(string))
    })))

    properties_apiVersionConstraint_minApiVersion = string
    properties_customProperties                   = optional(map(string))
    properties_disableGateway                     = optional(bool, true)
    properties_enableClientCertificate            = optional(bool, true)
    properties_natGatewayState                    = optional(string, "Disabled")
    properties_notificationSenderEmail            = optional(string)
    properties_publicIpAddressId                  = optional(string)
    properties_publicNetworkAccess                = optional(string, "Disabled")
    properties_publisherEmail                     = string
    properties_publisherName                      = string
    properties_restore                            = optional(bool, false)
    properties_virtualNetworkType                 = optional(string, "Internal")
    properties_platformVersion                    = optional(string, "stv2")
    properties_developerPortalStatus              = optional(string)
    properties_legacyPortalStatus                 = optional(string)
    properties_hostnameConfigurations             = optional(list(map(string)))
    properties_virtualNetworkConfiguration = optional(object({
      subnetResourceId = optional(string) # Required if virtualNetworkType is Internal
    }))


    sku = object({
      name     = string
      capacity = number
    })


    zones = optional(list(string), null)

    resource_group_name  = optional(string)
    policy_file_name     = optional(set(string), [])
    key_vault_secret_id  = optional(string)
    certificate_name     = optional(string)
    private_ep_subnet_id = optional(string)
    private_ep_name      = optional(string)
    private_dns_zone_id  = optional(list(string))
    products = optional(list(object({
      product_id            = string
      display_name          = string
      subscription_required = optional(bool, false)
      approval_required     = optional(bool, null)
      published             = optional(bool, true)
      description           = optional(string, null)
    })))

  })


}
