variable "settings" {
  description = "App Configuration Key"

  type = object({
    configuration_store_id = string
    key                    = string
    label                  = optional(string)
    type                   = optional(string, "kv")
    value                  = optional(string)
  })
}
