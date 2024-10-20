variable "root_id" {
  type        = string
  description = "Sets the value used for generating unique resource naming within the module."
}

variable "root_parent_id" {
  type        = string
  description = "Sets the value used for generating unique resource naming within the module."
  default     = "mg-ott007"
}

variable "primary_location" {
  type        = string
  description = "Sets the location for \"primary\" resources to be created in."
}

