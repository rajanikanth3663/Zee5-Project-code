locals {
  custom_landing_zones = {
    "mg-${var.root_id}5-nonprod" = {
      display_name               = "mg-ott007-nonprod"
      parent_management_group_id = "mg-ott007"
      subscription_ids           = ["951bb481-cd31-4ad0-add8-6914f12d4849", "93d7fd7e-3393-4ac8-af39-6898264b1f36", "subs-xxxxx-xxxx", "subs01-xxxxx-xxxx"]
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
  }
}