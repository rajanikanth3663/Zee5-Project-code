variable "root_id" {
  type        = string
  description = "Sets the value used for generating unique resource naming within the module."
  default     = "myorg"
}

variable "root_name" {
  type        = string
  description = "Sets the value used for the \"intermediate root\" management group display name."
  default     = "My Organization"
}

variable "primary_location" {
  type        = string
  description = "Sets the location for \"primary\" resources to be created in."
}

variable "connectivity_resources_tags" {
  type = map(string)
  default = {
    "service-name"       = ""
    "BusinessUnit"       = ""
    "CostCenter"         = ""
    "DisasterRecovery"   = ""
    "environment"        = ""
    "OwnerName"          = ""
    "servicecriticality" = ""
    "ISV"                = ""
    "DataClassification" = ""
    "service-family"     = ""
    "ticket-id"          = ""
    "lead-spoc"          = ""
    "Created_Date"       = ""
    "Updated_Date"       = ""
  }
}
