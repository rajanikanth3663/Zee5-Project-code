resource "azurerm_resource_group" "dns-rg" {
  name     = "rg-ottdetailzz-np-ci1-hubdns-0001"
  location = "centralindia"
}

module "custom_dns_zone" {
  for_each   = local.configure_private_dns_zone.settings
  source     = "../../../modules/public-dns-zones"
  settings   = each.value
  depends_on = [azurerm_resource_group.dns-rg]
}
