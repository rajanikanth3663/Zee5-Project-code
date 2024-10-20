variable "settings" {
  description = "Role assignments configuration"
  type = object({
    scope                = string
    role_definition_name = string
    principal_id         = string
  })
}
