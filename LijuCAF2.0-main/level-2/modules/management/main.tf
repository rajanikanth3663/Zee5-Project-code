data "azurerm_client_config" "core" {}

module "management" {
  source           = "Azure/caf-enterprise-scale/azurerm"
  version          = "~>4.2.0"
  default_location = var.primary_location

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm
    azurerm.management   = azurerm
  }

  root_parent_id                 = data.azurerm_client_config.core.tenant_id
  root_id                        = var.root_id
  deploy_core_landing_zones      = false
  deploy_management_resources    = true
  subscription_id_management     = data.azurerm_client_config.core.subscription_id
  configure_management_resources = local.configure_management_resources
}

# resource "azurerm_monitor_private_link_scope" "this" {
#   name                = local.configure_ampls_resources.settings.ampls_name
#   resource_group_name = local.configure_ampls_resources.settings.resource_group_name
# }

# resource "azurerm_monitor_private_link_scoped_service" "this" {
#   name                = local.configure_ampls_resources.settings.amplss_name
#   resource_group_name = local.configure_ampls_resources.settings.resource_group_name
#   scope_name          = azurerm_monitor_private_link_scope.this.name
#   linked_resource_id  = local.configure_ampls_resources.settings.resource_id
# }

# module "ampls" {
#   for_each = local.configure_ampls_resources.settings
#   source   = "../../../modules/ampls"
#   settings = each.value
# }

resource "azapi_resource" "this" {
  type      = "microsoft.insights/privateLinkScopes@2021-07-01-preview"
  name      = "ampls-ott007-np-ci1-hub-0001"
  location  = "global"
  parent_id = "/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubconnectivity-0001"
  body = jsonencode({
    properties = {
      accessModeSettings = {
        ingestionAccessMode = "PrivateOnly"
        queryAccessMode     = "PrivateOnly"
      }
    }
  })
}

resource "azurerm_private_endpoint" "this" {
  name                          = "pep-ott007-np-ci1-hubampls-0001"
  location                      = "centralindia"
  resource_group_name           = "rg-ott007-np-ci1-hubconnectivity-0001"
  subnet_id                     = "/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubconnectivity-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-np-ci1-hub-0001/subnets/snet-ott007-np-ci1-ampls-0003"
  custom_network_interface_name = "pepnic-ott007-np-ci1-hubampls-0001"
  private_service_connection {
    name                           = "pep-ott007-np-ci1-hubampls-0001"
    private_connection_resource_id = azapi_resource.this.id
    is_manual_connection           = false
    subresource_names              = ["azuremonitor"]
  }
  private_dns_zone_group {
    name = "pep-ott007-np-ci1-hubampls-0001"
    private_dns_zone_ids = ["/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.monitor.azure.com",
      # "/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.oms.opinsights.azure.com",
      # "/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.ods.opinsights.azure.com",
      # "/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net",
      # "/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubdns-0001/providers/Microsoft.Network/privateDnsZones/privatelink.agentsvc.azure-automation.net",
    ]
  }
  depends_on = [azapi_resource.this]
}
