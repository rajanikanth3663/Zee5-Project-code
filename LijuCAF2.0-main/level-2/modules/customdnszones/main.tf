module "custom_dns_zone" {
  for_each = local.configure_private_dns_zone.settings
  source   = "../../../modules/private-dns-zones"
  settings = each.value
}
