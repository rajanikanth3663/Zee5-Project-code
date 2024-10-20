variable "settings" {
  description = "App Configuration Key KV"

  type = object({
    configuration_store_id = string
    key                    = string
    label                  = optional(string)
    type                   = optional(string, "vault")
    value                  = optional(string)
    vault_key_reference    = optional(string)
  })
}
