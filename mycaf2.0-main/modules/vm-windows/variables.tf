variable "settings" {
  description = "vm configuration."
  type = object({
    name                     = string
    location                 = string
    resource_group_name      = string
    admin_username           = string
    admin_password           = string
    size                     = string
    availability_set_id      = optional(string, null)
    enable_automatic_updates = optional(bool, true)
    license_type             = optional(string, "None")
    computer_name            = optional(string, null)
    tags                     = optional(map(string), null)
    os_disk = object({
      caching                   = string
      storage_account_type      = string
      disk_size_gb              = optional(string, "127")
      write_accelerator_enabled = optional(bool, false)
    })

    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
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
  })
}
