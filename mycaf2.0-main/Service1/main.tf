module "appconfig-key" {
  for_each = local.configure_appconfig_keys_resources.settings
  settings = each.value
  source   = "git::git@github.com:ZEE-5/azure-zeedigital-tf-modules.git//app-config-key?ref=uat"
}

module "appconfig-kv" {
  for_each = local.configure_appconfig_kv_resources.settings
  settings = each.value
  source   = "git::git@github.com:ZEE-5/azure-zeedigital-tf-modules.git//app-config-key-kv?ref=uat"
}