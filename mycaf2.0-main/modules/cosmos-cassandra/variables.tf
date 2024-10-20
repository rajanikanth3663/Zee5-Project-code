variable "settings" {
  description = "cosmos cassandra configuration"

  type = object({
    name                = string
    resource_group_name = string
    account_name        = string
    throughput          = optional(number, 400)
  })
}
