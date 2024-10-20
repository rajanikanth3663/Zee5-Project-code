variable "settings" {
  description = "cosmos mongodb configuration"

  type = object({
    name                = string
    resource_group_name = string
    account_name        = string
    throughput          = optional(number, 400)
  })
}
