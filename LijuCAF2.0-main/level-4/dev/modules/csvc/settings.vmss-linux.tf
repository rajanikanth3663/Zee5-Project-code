locals {
  configure_vm_linuxss_customimage = {
    settings = {
      vmss1 = {
        name                = "vmss-ott007-dev-ci1-cssssolr-0001"
        location            = "centralindia"
        resource_group_name = "rg-ott007-dev-ci1-csss-0002"
        admin_username      = "testadmin"
        admin_password      = "Azure@123456"
        sku                 = "Standard_D2lds_v5"
        instances           = 3

        source_image_id = "/subscriptions/075e61b7-0274-436e-85df-3fe6f5fb33a1/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/Ubuntu1804SolrHardenedVM-Gimage/versions/0.0.1"

        os_disk = {
          storage_account_type = "StandardSSD_LRS"
          caching              = "ReadWrite"
        }

        storage_data_disk = [{
          name              = "vmss-ott007-dev-ci1-cssssolr-0001-datadisk-0001"
          caching           = "ReadWrite"
          create_option     = "Empty"
          disk_size_gb      = 64
          lun               = 2
          managed_disk_type = "StandardSSD_LRS"
          },
          {
            name              = "vmss-ott007-dev-ci1-cssssolr-0001-datadisk-0002"
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
          name = "vmss-ott007-dev-ci1-cssssolr-0001-nic"
          ip_configuration = {
            subnet_id = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-app-0007"
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
