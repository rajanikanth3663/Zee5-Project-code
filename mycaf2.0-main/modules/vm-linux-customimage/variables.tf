variable "settings" {
  description = "configure_vm_linux_custom_resources"

  type = object({

    name                = string
    location            = string
    resource_group_name = string
    vm_size             = string
    zones               = optional(list(string))

    storage_os_disk = object({
      name              = string
      os_type           = string
      caching           = string
      create_option     = string
      managed_disk_type = string
    })

    managed_disk = optional(object({
      name                 = string
      storage_account_type = string
      create_option        = string
      disk_size_gb         = number
      lun                  = number
      caching              = string
    }))

    storage_data_disk = optional(list(object({
      name              = string
      caching           = string
      create_option     = string
      disk_size_gb      = number
      lun               = number
      managed_disk_type = string
    })))

    storage_image_reference = string

    os_profile = object({
      computer_name  = string
      admin_username = string
      admin_password = string
      custom_data    = optional(string)
    })

    plan = optional(object({
      publisher = string
      name      = string
      product   = string
    }))

    os_profile_linux_config = optional(object({
      disable_password_authentication = optional(bool, false)
    }))

    network_interface = object({
      name                          = string
      enable_accelerated_networking = optional(bool, false)
      enable_ip_forwarding          = optional(bool, false)
      ip_configuration = object({
        subnet_id                     = string
        private_ip_address_allocation = optional(string, "Dynamic")
        private_ip_address            = optional(string, null)
        primary                       = optional(bool, true)
        public_ip_address_id          = optional(string, null)
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

    # role_assignment = list(object({
    #   scope                = string
    #   role_definition_name = string
    #   principal_id         = string
    # }))

    tags = optional(map(string), {
      managedBy = "terraform"
    })
  })
}
