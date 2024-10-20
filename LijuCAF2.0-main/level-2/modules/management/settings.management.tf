locals {
  configure_management_resources = {
    settings = {
      log_analytics = {
        enabled = true
        config = {
          retention_in_days                                 = var.log_retention_in_days
          enable_monitoring_for_vm                          = false
          enable_monitoring_for_vmss                        = false
          enable_solution_for_agent_health_assessment       = false
          enable_solution_for_anti_malware                  = false
          enable_solution_for_change_tracking               = false
          enable_solution_for_service_map                   = false
          enable_solution_for_sql_assessment                = false
          enable_solution_for_sql_vulnerability_assessment  = false
          enable_solution_for_sql_advanced_threat_detection = false
          enable_solution_for_updates                       = false
          enable_solution_for_vm_insights                   = false
          enable_solution_for_container_insights            = false
          enable_sentinel                                   = false
        }
      }
      security_center = {
        enabled = false
        config = {
          email_security_contact                                = var.security_alerts_email_address
          enable_defender_for_apis                              = true
          enable_defender_for_app_services                      = true
          enable_defender_for_arm                               = true
          enable_defender_for_containers                        = true
          enable_defender_for_cosmosdbs                         = true
          enable_defender_for_cspm                              = true
          enable_defender_for_dns                               = true
          enable_defender_for_key_vault                         = true
          enable_defender_for_oss_databases                     = true
          enable_defender_for_servers                           = true
          enable_defender_for_servers_vulnerability_assessments = true
          enable_defender_for_sql_servers                       = true
          enable_defender_for_sql_server_vms                    = true
          enable_defender_for_storage                           = true
        }
      }
    }
    location = var.primary_location
    tags     = var.management_resources_tags
    advanced = {
      custom_settings_by_resource_type = {
        azurerm_resource_group = {
          management = {
            name = "rg-ott007-np-ci1-hubmanagement-0001"
          }
        }
        azurerm_log_analytics_workspace = {
          management = {
            name                       = "log-ott007-np-ci1-hub-0001"
            internet_ingestion_enabled = true
            internet_query_enabled     = true

          }
        }
        azurerm_automation_account = {
          management = {
            name                          = "aa-ott007-np-ci1-hub-0001"
            public_network_access_enabled = false
          }
        }
      }
    }
  }
}
