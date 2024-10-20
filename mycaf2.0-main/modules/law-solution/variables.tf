variable "settings" {
  description = "laws"
  type = object({
    solution_name         = string
    location              = string
    resource_group_name   = string
    workspace_resource_id = string
    workspace_name        = string

    plan = optional(list(object({
      publisher = string
      product   = string
    })))

  })
}
