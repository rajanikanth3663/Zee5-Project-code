variable "settings" {
  description = "MySQL configurations"
  type = object({
    name                = string
    resource_group_name = string
    server_name         = string
    charset             = optional(string, "utf8mb4")
    collation           = optional(string, "utf8mb4_0900_ai_ci")
  })
}
