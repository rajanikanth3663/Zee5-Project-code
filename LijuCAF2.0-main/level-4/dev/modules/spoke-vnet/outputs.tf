output "id" {
  description = "The ID of the VNET's."
  value       = module.vnet[0].id
}

# output "instrumentation_key" {
#   description = "application insights instrumentation_key"
#   value = module.ai["appi-ott007-dev-ci1-0001"].instrumentation_key
# }

output "law_id" {
  description = "law ID"
  value       = module.law["log-ott007-dev-ci1-0001"].id
}