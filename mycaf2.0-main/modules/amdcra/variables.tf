variable "settings" {
  description = "App Service Plan configuration."
  type = object({
    target_resource_id          = string
    data_collection_endpoint_id = string

  })
}
