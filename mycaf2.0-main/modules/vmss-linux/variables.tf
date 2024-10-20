variable "settings" {
  description = "configure_vm_linux_custom_resources"

  type = object({

    name                = string
    location            = string
    resource_group_name = string
    admin_username      = string
    admin_password      = string
    sku                 = optional(string, "Standard_D4s_v3")
    instances           = string

    source_image_reference = optional(object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    }))

    source_image_id = optional(string, null)

    plan = optional(object({
      publisher = string
      name      = string
      product   = string
    }))

    scale_in = optional(object({
      rule                   = optional(string, "Default")
      force_deletion_enabled = optional(bool, false)
    }))

    os_disk = object({
      storage_account_type = string
      caching              = string
    })

    storage_data_disk = optional(list(object({
      name              = string
      caching           = string
      create_option     = string
      disk_size_gb      = number
      lun               = number
      managed_disk_type = string
    })))

    # os_profile = object({
    #   computer_name_prefix = string
    #   admin_username       = string
    #   admin_password       = string
    # })

    os_profile_linux_config = optional(object({
      disable_password_authentication = optional(bool, false)
    }))

    network_interface = object({
      name = string
      ip_configuration = object({
        subnet_id                              = string
        primary                                = optional(bool, true)
        load_balancer_backend_address_pool_ids = optional(list(string))
      })
    })

    vm_extension = optional(object({
      name                 = string
      publisher            = optional(string)
      type                 = optional(string)
      type_handler_version = optional(string)
      csfile               = string
      mount_point_name     = optional(string)
      file_system          = optional(string)
      disk_partition       = optional(string)
      fileUris             = optional(string)
      storage_account_name = optional(string)
      storage_account_key  = optional(string)
      storage_uri          = optional(string)
      data_disk            = optional(string)
      log_disk             = optional(string)
    }))

    autoscale_setting = object({
      profile = object({
        name = optional(string, "defaultProfile")
        capacity = object({
          default = number
          minimum = number
          maximum = number
        })

        rule = list(object(
          {
            metric_trigger = object({
              metric_name      = string
              time_grain       = string
              statistic        = string
              time_window      = string
              time_aggregation = string
              operator         = string
              threshold        = number
            })

            scale_action = object({
              direction = string
              type      = string
              value     = string
              cooldown  = string
            })
          }
        ))

        predictive = object({
          scale_mode      = optional(string, "Enabled")
          look_ahead_time = optional(string, "PT5M")
        })
      })
    })

    tags = optional(map(string), {
      managedBy = "terraform"
    })
  })
}
