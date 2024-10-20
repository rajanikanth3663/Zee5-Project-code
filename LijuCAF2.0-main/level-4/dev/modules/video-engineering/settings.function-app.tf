locals {
  common_fun_settings_ve = {
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
    storage_account_id                                       = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-ve-0001/providers/Microsoft.Storage/storageAccounts/stott007devci1ve0001"
    service_plan_id_asp-ott007-dev-ci1-ve-0001                 = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-ve-0001/providers/Microsoft.Web/serverfarms/asp-ott007-dev-ci1-ve-0001"
    service_plan_id_asp-ott007-dev-ci1-ve-0002                 = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-ve-0001/providers/Microsoft.Web/serverfarms/asp-ott007-dev-ci1-ve-0002"
    storage_account_name                                     = "stott007devci1ve0001"
    resource_group_name                                      = "rg-ott007-dev-ci1-ve-0001"
    location                                                 = "centralindia"
    storage_account_access_key                               = module.storage["stott007devci1ve0001"].primary_access_key
    APPINSIGHTS_INSTRUMENTATIONKEY                           = module.ai["appi-ott007-dev-ci1-ve-0001"].instrumentation_key
    python_version                                           = "3.11"
    virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0005 = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-fappint-0005"
    virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0004 = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-fappint-0004"
    identity = {
      type         = "UserAssigned"
      identity_ids = [module.uai["id-ott007-dev-ci1-ve-0001"].id]
    }

    private_endpoint = {
      endpoint_name        = "pep-ott007-np-ci1-vefa"
      subnet_id            = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-app-0007"
      connection_name      = "pep-ott007-np-ci1-vefa"
      private_dns_zone_ids = ["/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.azurewebsites.net"]
    }
  }
}




locals {
  configure_function_app_resources = {
    settings = {
      fa-ott007-dev-ci1-ve-metadata-handler-01 = {
        name                       = "fa-ott007-dev-ci1-ve-metadata-handler-01"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0001
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }

        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }

        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0005
        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0001"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0001"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags

      }

      fa-ott007-dev-ci1-ve-copy-script-stitching-02 = {
        name                       = "fa-ott007-dev-ci1-ve-copy-script-stitching-02"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0001
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0005

        private_endpoint = {
          endpoint_name           = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0002"
          subnet_id               = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name         = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0002"
          private_dns_zone_ids    = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
          private_dns_zone_ids_ai = []
        }

        tags = local.common_fun_settings_ve.tags

      }

      fa-ott007-dev-ci1-ve-image-refresh-api-03 = {
        name                       = "fa-ott007-dev-ci1-ve-image-refresh-api-03"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0001
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0005

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0003"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0003"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags

      }

      fa-ott007-dev-ci1-ve-accel-transcoding-04 = {
        name                       = "fa-ott007-dev-ci1-ve-accel-transcoding-04"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0001
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0005

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0004"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0004"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags

      }

      fa-ott007-dev-ci1-ve-trans-blob-to-sb-05 = {
        name                       = "fa-ott007-dev-ci1-ve-trans-blob-to-sb-05"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0001
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0005

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0005"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0005"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags

      }

      fa-ott007-dev-ci1-ve-news-ott007-blob-sync-06 = {
        name                       = "fa-ott007-dev-ci1-ve-news-ott007-blob-sync-06"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0001
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0005

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0006"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0006"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags

      }

      fa-ott007-dev-ci1-ve-toch-handeling-07 = {
        name                       = "fa-ott007-dev-ci1-ve-toch-handeling-07"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0001
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0005

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0007"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0007"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }


      fa-ott007-dev-ci1-ve-blob-to-sb-queue-08 = {
        name                       = "fa-ott007-dev-ci1-ve-blob-to-sb-queue-08"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0001
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0005

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0008"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0008"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }

      fa-ott007-dev-ci1-ve-manifest-rename-09 = {
        name                       = "fa-ott007-dev-ci1-ve-manifest-rename-09"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0001
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0005

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0009"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0009"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }
      fa-ott007-dev-ci1-ve-job-creator-10 = {
        name                       = "fa-ott007-dev-ci1-ve-job-creator-10"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0001
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0005

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0010"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0010"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }

      fa-ott007-dev-ci1-ve-bation-qc-solution-11 = {
        name                       = "fa-ott007-dev-ci1-ve-bation-qc-solution-11"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0001
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0005

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0011"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0011"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }

      fa-ott007-dev-ci1-ve-job-status-ateme-12 = {
        name                       = "fa-ott007-dev-ci1-ve-job-status-ateme-12"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0001
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0005

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0012"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0012"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }

      fa-ott007-dev-ci1-ve-live-alerts-ateme-13 = {
        name                       = "fa-ott007-dev-ci1-ve-live-alerts-ateme-13"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0001
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0005

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0013"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0013"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }
      fa-ott007-dev-ci1-ve-drm-data-to-mongo-db-14 = {
        name                       = "fa-ott007-dev-ci1-ve-drm-data-to-mongo-db-14"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0001
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0005

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0014"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0014"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }

      fa-ott007-dev-ci1-ve-post-trans-processing-15 = {
        name                       = "fa-ott007-dev-ci1-ve-post-trans-processing-15"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0001
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0005

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0015"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0015"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }


      fa-ott007-dev-ci1-ve-dash-manifest-modf-16 = {
        name                       = "fa-ott007-dev-ci1-ve-dash-manifest-modf-16"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0001
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0005

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0016"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0016"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }

      fa-ott007-dev-ci1-ve-stitching-function-17 = {
        name                       = "fa-ott007-dev-ci1-ve-stitching-function-17"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0001
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0005

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0017"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0017"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }

      fa-ott007-dev-ci1-ve-appd-url-to-rss-feed-18 = {
        name                       = "fa-ott007-dev-ci1-ve-appd-url-to-rss-feed-18"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0002
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0004

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0018"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0018"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }

      ffa-ott007-dev-ci1-ve-ateme-input-switching-19 = {
        name                       = "fa-ott007-dev-ci1-ve-ateme-input-switching-19"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0002
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0004

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0019"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0019"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }

      fa-ott007-dev-ci1-ve-re-nbr-blob-to-sb-20 = {
        name                       = "fa-ott007-dev-ci1-ve-re-nbr-blob-to-sb-20"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0002
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0004

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0020"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0020"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }


      fa-ott007-dev-ci1-ve-re-nbr-sb-to-atem-21 = {
        name                       = "fa-ott007-dev-ci1-ve-re-nbr-sb-to-atem-21"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0002
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0004

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0021"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0021"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }

      fa-ott007-dev-ci1-ve-aston-bumper-22 = {
        name                       = "fa-ott007-dev-ci1-ve-aston-bumper-22"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0002
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0004

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0022"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0022"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }

      fa-ott007-dev-ci1-ve-bento4-packaging-fn-23 = {
        name                       = "fa-ott007-dev-ci1-ve-bento4-packaging-fn-23"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0002
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0004

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0023"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0023"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }

      fa-ott007-dev-ci1-ve-cp-trans-output-clips-24 = {
        name                       = "fa-ott007-dev-ci1-ve-cp-trans-output-clips-24"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0002
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0004

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0024"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0024"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }

      fa-ott007-dev-ci1-ve-daily-shrts-sb-create-25 = {
        name                       = "fa-ott007-dev-ci1-ve-daily-shrts-sb-create-25"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0002
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0004

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0025"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0025"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }


      fa-ott007-dev-ci1-ve-hls-subtitle-addition-26 = {
        name                       = "fa-ott007-dev-ci1-ve-hls-subtitle-addition-26"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0002
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0004

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0026"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0026"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }

      fa-ott007-dev-ci1-ve-renaming-ateme-csv-27 = {
        name                       = "fa-ott007-dev-ci1-ve-renaming-ateme-csv-27"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0002
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0004

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0027"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0027"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }

      fa-ott007-dev-ci1-ve-cdn-behaviour-28 = {
        name                       = "fa-ott007-dev-ci1-ve-cdn-behaviour-28"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0002
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0004

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0028"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0028"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }

      fa-ott007-dev-ci1-ve-29 = {
        name                       = "fa-ott007-dev-ci1-ve-29"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0002
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0004

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0029"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0029"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }


      fa-ott007-dev-ci1-ve-30 = {
        name                       = "fa-ott007-dev-ci1-ve-30"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0002
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0004

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0030"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0030"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }

      fa-ott007-dev-ci1-ve-31 = {
        name                       = "fa-ott007-dev-ci1-ve-31"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0002
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0004

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0031"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0031"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }

      fa-ott007-dev-ci1-ve-32 = {
        name                       = "fa-ott007-dev-ci1-ve-32"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0002
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0004

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0032"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0032"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }


      fa-ott007-dev-ci1-ve-33 = {
        name                       = "fa-ott007-dev-ci1-ve-33"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0002
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0004

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0033"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0033"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }


      fa-ott007-dev-ci1-ve-34 = {
        name                       = "fa-ott007-dev-ci1-ve-34"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0002
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0004

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0034"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0034"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }

      fa-ott007-dev-ci1-ve-35 = {
        name                       = "fa-ott007-dev-ci1-ve-35"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0002
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0004

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0035"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-0035"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }


      fa-ott007-dev-ci1-ve-cs-process1-36 = {
        name                       = "fa-ott007-dev-ci1-ve-cs-process1-36"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0001
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0005

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-36"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-36"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }

      fa-ott007-dev-ci1-ve-cs-process2-37 = {
        name                       = "fa-ott007-dev-ci1-ve-cs-process2-37"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0001
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0005

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-37"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-37"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }
      fa-ott007-dev-ci1-ve-cs-process3-38 = {
        name                       = "fa-ott007-dev-ci1-ve-cs-process3-38"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0001
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0005

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-38"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-38"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }
      fa-ott007-dev-ci1-ve-cs-report-generator-39 = {
        name                       = "fa-ott007-dev-ci1-ve-cs-report-generator-39"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0001
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0005

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-39"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-39"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }
      fa-ott007-dev-ci1-ve-lease-line-monitor-40 = {
        name                       = "fa-ott007-dev-ci1-ve-lease-line-monitor-40"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0001
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0005

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-40"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-40"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }
      fa-ott007-dev-ci1-ve-news-vod-rss-db-41 = {
        name                       = "fa-ott007-dev-ci1-ve-news-vod-rss-db-41"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0001
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0005

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-41"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-41"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }
      fa-ott007-dev-ci1-ve-cache-purge-42 = {
        name                       = "fa-ott007-dev-ci1-ve-cache-purge-42"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0001
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0005

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-42"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-42"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }
      fa-ott007-dev-ci1-ve-redundant-delete-43 = {
        name                       = "fa-ott007-dev-ci1-ve-redundant-delete-43"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0001
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0005

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-43"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-43"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }
      fa-ott007-dev-ci1-ve-v2-premium-api-44 = {
        name                       = "fa-ott007-dev-ci1-ve-v2-premium-api-44"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0001
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          python_version = local.common_fun_settings_ve.python_version
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0005

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-44"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-44"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }
      fa-ott007-dev-ci1-ve-mediathek-apis-45 = {
        name                       = "fa-ott007-dev-ci1-ve-mediathek-apis-45"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0002
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          node_version = "18"
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0004

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-45"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-45"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }
      fa-ott007-dev-ci1-ve-manifest-creation-46 = {
        name                       = "fa-ott007-dev-ci1-ve-manifest-creation-46"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0002
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          node_version = "18"
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0004

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-46"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-46"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }
      fa-ott007-dev-ci1-ve-nodejs-47 = {
        name                       = "fa-ott007-dev-ci1-ve-nodejs-47"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0002
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          node_version = "18"
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0004

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-47"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-47"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }
      fa-ott007-dev-ci1-ve-nodejs-48 = {
        name                       = "fa-ott007-dev-ci1-ve-nodejs-48"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0002
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          node_version = "18"
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0004

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-48"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-48"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }
      fa-ott007-dev-ci1-ve-nodejs-49 = {
        name                       = "fa-ott007-dev-ci1-ve-nodejs-49"
        location                   = local.common_fun_settings_ve.location
        resource_group_name        = local.common_fun_settings_ve.resource_group_name
        service_plan_id            = local.common_fun_settings_ve.service_plan_id_asp-ott007-dev-ci1-ve-0002
        storage_account_name       = local.common_fun_settings_ve.storage_account_name
        storage_account_access_key = local.common_fun_settings_ve.storage_account_access_key
        storage_account_id         = local.common_fun_settings_ve.storage_account_id

        application_stack = {
          node_version = "18"
        }
        app_settings = {
          "APPINSIGHTS_INSTRUMENTATIONKEY" = local.common_fun_settings_ve.APPINSIGHTS_INSTRUMENTATIONKEY
        }

        identity = {
          type         = local.common_fun_settings_ve.identity.type
          identity_ids = local.common_fun_settings_ve.identity.identity_ids
        }


        virtual_network_subnet_id = local.common_fun_settings_ve.virtual_network_subnet_id_snet-ott007-dev-ci1-fappint-0004

        private_endpoint = {
          endpoint_name        = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-49"
          subnet_id            = local.common_fun_settings_ve.private_endpoint.subnet_id
          connection_name      = "${local.common_fun_settings_ve.private_endpoint.endpoint_name}-49"
          private_dns_zone_ids = local.common_fun_settings_ve.private_endpoint.private_dns_zone_ids
        }

        tags = local.common_fun_settings_ve.tags
      }
    }
  }
}
