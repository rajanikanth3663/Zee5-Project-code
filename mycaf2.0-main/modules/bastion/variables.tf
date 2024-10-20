variable "settings" {
  type = object({
    name                   = string
    location               = string
    resource_group_name    = string
    copy_paste_enabled     = optional(bool, true)
    file_copy_enabled      = optional(bool, false)
    sku                    = optional(string, "Standard")
    ip_connect_enabled     = optional(bool, false)
    scale_units            = optional(number, 2)
    shareable_link_enabled = optional(bool, false)
    tunneling_enabled      = optional(bool, false)

    ip_configuration = object({
      name                 = optional(string, "configuration")
      subnet_id            = string
      public_ip_address_id = string
    })
    tags = optional(map(string), null)
  })
}
