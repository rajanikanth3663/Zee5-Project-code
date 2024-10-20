locals {
  configure_vm_linuxss_customimage = {
    settings = {
      "vmss-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0001" = {
        name                = "vmss-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0001"
        location            = local.common.location
        resource_group_name = "${local.common.resource_group_name_csvc02}"
        admin_username      = "testadmin"
        admin_password      = var.vm_admin_password
        sku                 = "Standard_D2lds_v5"
        instances           = 3

        source_image_id = "/subscriptions/${local.sec_subscription_id}/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/Ubuntu1804SolrHardenedVM-Gimage/versions/0.0.1"


        os_disk = {
          storage_account_type = "StandardSSD_LRS"
          caching              = "ReadWrite"
        }

        storage_data_disk = [{
          name              = "vmss-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0001-datadisk-0001"
          caching           = "ReadWrite"
          create_option     = "Empty"
          disk_size_gb      = 64
          lun               = 2
          managed_disk_type = "StandardSSD_LRS"
          },
          {
            name              = "vmss-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0001-datadisk-0002"
            caching           = "ReadWrite"
            create_option     = "Empty"
            disk_size_gb      = 64
            lun               = 3
            managed_disk_type = "StandardSSD_LRS"
        }]

        plan = {
          publisher = "canonical"
          name      = "pro-18_04-lts-gen2"
          product   = "0001-com-ubuntu-pro-bionic"
        }

        scale_in = {
          rule                   = "Default"
          force_deletion_enabled = false
        }

        network_interface = {
          name = "vmss-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0001-nic"
          ip_configuration = {
            subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
          }
        }

        autoscale_setting = {
          profile = {
            capacity = {
              default = 1
              minimum = 1
              maximum = 3
            }

            rule = [{
              metric_trigger = {
                metric_name      = "Percentage CPU"
                time_grain       = "PT1M"
                statistic        = "Average"
                time_window      = "PT5M"
                time_aggregation = "Average"
                operator         = "GreaterThan"
                threshold        = 75
              }
              scale_action = {
                direction = "Increase"
                type      = "ChangeCount"
                value     = "1"
                cooldown  = "PT1M"
              }
              },
              {
                metric_trigger = {
                  metric_name      = "Percentage CPU"
                  time_grain       = "PT1M"
                  statistic        = "Average"
                  time_window      = "PT5M"
                  time_aggregation = "Average"
                  operator         = "LessThan"
                  threshold        = 25
                }
                scale_action = {
                  direction = "Decrease"
                  type      = "ChangeCount"
                  value     = "1"
                  cooldown  = "PT1M"
                }
              },
              # {
              #     metric_trigger = {
              #       metric_name      = "Network in Total"
              #       time_grain       = "PT1M"
              #       statistic        = "Average"
              #       time_window      = "PT5M"
              #       time_aggregation = "Average"
              #       operator         = "GreaterThan"
              #       threshold        = 75
              #     }
              #     scale_action = {
              #       direction = "Increase"
              #       type      = "ChangeCount"
              #       value     = "1"
              #       cooldown  = "PT5M"
              #     }
              #   },
              #   {
              #     metric_trigger = {
              #       metric_name      = "Network in Total"
              #       time_grain       = "PT1M"
              #       statistic        = "Average"
              #       time_window      = "PT5M"
              #       time_aggregation = "Average"
              #       operator         = "LessThan"
              #       threshold        = 25
              #     }
              #     scale_action = {
              #       direction = "Decrease"
              #       type      = "ChangeCount"
              #       value     = "1"
              #       cooldown  = "PT10M"
              #     }
              # }
            ]

            predictive = {

            }
          }
        }
      }
    }
  }
}