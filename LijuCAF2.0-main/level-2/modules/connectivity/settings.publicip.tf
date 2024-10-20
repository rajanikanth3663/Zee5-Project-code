locals {
  firewall_ip = {
    settings = {
      name                 = "pip-ott007-np-ci1-afw-0001"
      resource_group_name  = "rg-ott007-np-ci1-hubconnectivity-0001"
      location             = "centralindia"
      allocation_method    = "Static"
      ddos_protection_mode = "Enabled"
      sku                  = "Standard"
      zones                = [1, 2, 3]
      tags                 = var.connectivity_resources_tags
    }
  }
  firewall_management_ip = {
    settings = {
      name                 = "pip-ott007-np-ci1-afwmgmt-0001"
      resource_group_name  = "rg-ott007-np-ci1-hubconnectivity-0001"
      location             = "centralindia"
      allocation_method    = "Static"
      ddos_protection_mode = "Enabled"
      sku                  = "Standard"
      zones                = [1, 2, 3]
      tags                 = var.connectivity_resources_tags
    }
  }
}