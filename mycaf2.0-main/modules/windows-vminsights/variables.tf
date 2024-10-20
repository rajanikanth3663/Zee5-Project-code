variable "settings" {
  description = "Windows VM Insights"

  type = object({
    vm_name                    = string
    location                   = string
    resource_group_name        = string
    auto_upgrade_minor_version = optional(bool, true)
    automatic_upgrade_enabled  = optional(bool, true)
    data_collection_rule = object({
      id = string
    })
    monitor_data_collection_rule_association = object({
      name = string
    })
    data_collection_endpoint = object({
      id = string
    })
  })
}

variable "vm_id" {
  description = "ID of the Virtual Machine"
  type        = string
}