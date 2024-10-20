variable "settings" {
  description = "Postgres configurations"
  type = object({
    name      = string
    server_id = string
    collation = optional(string, "en_US.utf8")
    charset   = optional(string, "utf8")
  })
}
