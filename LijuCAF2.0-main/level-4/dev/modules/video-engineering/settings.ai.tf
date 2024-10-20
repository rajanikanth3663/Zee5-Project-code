locals {
  configure_ai_resources = {
    settings = {
      appi-ott007-dev-ci1-ve-0001 = {
        resource_group_name = "rg-ott007-dev-ci1-ve-0001"
        name                = "appi-ott007-dev-ci1-ve-0001"
        location            = "centralindia"
        application_type    = "web"
        workspace_id        = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.OperationalInsights/workspaces/log-ott007-dev-ci1-0001"
      }
    }
  }
}
