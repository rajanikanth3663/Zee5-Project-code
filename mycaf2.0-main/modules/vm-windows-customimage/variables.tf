variable "settings" {
  description = "configure_vm_windows_custom_resources"

  type = object({

    name                = string
    location            = string
    resource_group_name = string
    vm_size             = string

    storage_os_disk = object({
      name              = string
      os_type           = string
      caching           = string
      create_option     = string
      managed_disk_type = string
    })

    storage_image_reference = string

    os_profile = object({
      computer_name  = string
      admin_username = string
      admin_password = string
    })

    storage_data_disk = optional(list(object({
      name              = string
      caching           = string
      create_option     = string
      disk_size_gb      = number
      lun               = number
      managed_disk_type = string
    })))


    os_profile_windows_config = object({
      provision_vm_agent        = bool
      enable_automatic_upgrades = bool
    })

    network_interface = object({
      name                          = string
      enable_accelerated_networking = optional(bool, false)
      ip_configuration = object({
        subnet_id                     = string
        private_ip_address_allocation = optional(string, "Dynamic")
        private_ip_address            = optional(string, null)
        primary                       = optional(bool, true)
      })
    })

    tags = optional(map(string), {
      managedBy = "terraform"
    })
  })
}
