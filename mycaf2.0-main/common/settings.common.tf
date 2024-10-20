locals {
  common = {

    subscription_id  = "subs-******-******"
    tenant_id        = "ten-*****"
    location         = "centralindia"
    dep_env          = "dev"
    app_name         = "csvc"
    bu_name          = "xx77"
    app_name_ateme   = "ateme"
    app_name_ve      = "ve"
    app_name_cms     = "cms"
    app_name_medthek = "medthek"
    app_name_adtek   = "adtek"
    app_name_adtech  = "adtech"
    # resource_group_name_csvc = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001"
    resource_group_name_csvc          = "rg-xx77-dev-ci1-csvc-0001"
    resource_group_name_csvc02        = "rg-xx77-dev-ci1-csvc-0002"
    resource_group_name_ateme         = "rg-xx77-dev-ci1-ateme-0001"
    resource_group_name_ve            = "rg-xx77-dev-ci1-ve-0001"
    resource_group_name_hubdns        = "rg-xx77-np-ci1-hubdns-0001"
    resource_group_name_hubmanagement = "rg-xx77-np-ci1-hubmanagement-0001"
    ddos_protection_plan_id           = "/subscriptions/subs3-******-******/resourceGroups/rg-its-np-ci1-mgmt-0001/providers/Microsoft.Network/ddosProtectionPlans/ddosplan-its-np-ci1-sec-0001"
    law_workspace_id                  = module.law["log-xx77-dev-ci1-0001"].id
    hub_storage_account_id            = "/subscriptions/subs-******-*****/resourceGroups/rg-xx77-np-ci1-hubconnectivity-0001/providers/Microsoft.Storage/storageAccounts/stxx77npci1hub0001"
    hub_law_id                        = "/subscriptions/subs-******-*****/resourceGroups/rg-xx77-np-ci1-hubmanagement-0001/providers/Microsoft.OperationalInsights/workspaces/log-xx77-np-ci1-hub-0001"
    backup_policy_id                  = "/subscriptions/subs-******-******/resourceGroups/rg-xx77-dev-ci1-csvc-0001/providers/Microsoft.RecoveryServices/vaults/rsv-xx77-dev-ci1-0001/backupPolicies/bkpol-xx77-dev-ci1-0001"
    hub_law_workspaceID               = "b7831c77-8f47-43fe-aef9-67e7e35be723"
  }
}

#array of all the subnets
locals {
  csvc_subnet_id = module.vnet["vnet-xx77-dev-ci1-csvc-0001"].subnet_ids

}
locals {
  tenant_id                         = "ten-*****"
  subscription_id                   = "subs-******-******"
  hub_subscription_id               = "subs-******-*****"
  sec_subscription_id               = "subs3-******-******"
  servicebus_queue_ids              = module.servicebus["sb-xx77-dev-ci1-ve-0001"].servicebus_queue_ids
  location                          = "centralindia"
  dep_env                           = "dev"
  app_name                          = "csvc"
  bu_name                           = "xx77"
  app_name_ateme                    = "ateme"
  app_name_ve                       = "ve"
  app_name_cms                      = "cms"
  resource_group_name_csvc          = "rg-xx77-dev-ci1-csvc-0001"
  resource_group_name_csvc02        = "rg-xx77-dev-ci1-csvc-0002"
  resource_group_name_hubdns        = "rg-xx77-np-ci1-hubdns-0001"
  resource_group_name_hubmanagement = "rg-xx77-np-ci1-hubmanagement-0001"
}

variable "vm_admin_password" {
  type    = string
  default = "Azure@123456"
}

variable "POSTGRES_PASSWORD" {
  type    = string
  default = ""
}

variable "MYSQL_PASSWORD" {
  type    = string
  default = "123"
}

variable "PAAS_SQL_PASSWORD" {
  type    = string
  default = "!@#"
}

variable "SQLMI_PASSWORD" {
  type    = string
  default = "@dmin"
}
