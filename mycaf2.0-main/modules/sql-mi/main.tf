/*resource "azurerm_network_security_rule" "allow_misubnet_outbound" {
  name                        = "allow_misubnet_outbound"
  priority                    = 1010
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "10.173.225.192/27"
  destination_address_prefix  = "*"
  resource_group_name         = var.settings.resource_group_name
  network_security_group_name = var.settings.network_security_group_name
}

resource "azurerm_network_security_rule" "allow_management_inbound_corpnetsaw" {
  name                        = "allow_management_inbound_corpnetsaw"
  priority                    = 1000
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges     = ["9000", "9003", "1440"]
  source_address_prefix       = "CorpNetSaw"
  destination_address_prefix  = "10.173.225.192/27"
  resource_group_name         = var.settings.resource_group_name
  network_security_group_name = var.settings.network_security_group_name
}

resource "azurerm_network_security_rule" "allow_management_inbound_corpnetpublic" {
  name                        = "allow_management_inbound_corpnetpublic"
  priority                    = 1010
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges     = ["9000", "9003"]
  source_address_prefix       = "CorpNetPublic"
  destination_address_prefix  = "10.173.225.192/27"
  resource_group_name         = var.settings.resource_group_name
  network_security_group_name = var.settings.network_security_group_name
}

resource "azurerm_network_security_rule" "allow_management_inbound" {
  name                        = "allow_management_inbound"
  priority                    = 1020
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges     = ["9000", "9003", "1438", "1440", "1452"]
  source_address_prefix       = "SqlManagement"
  destination_address_prefix  = "10.173.225.192/27"
  resource_group_name         = var.settings.resource_group_name
  network_security_group_name = var.settings.network_security_group_name
}

resource "azurerm_network_security_rule" "allow_misubnet_inbound" {
  name                        = "allow_misubnet_inbound"
  priority                    = 1030
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "10.173.225.192/27"
  destination_address_prefix  = "*"
  resource_group_name         = var.settings.resource_group_name
  network_security_group_name = var.settings.network_security_group_name
}

resource "azurerm_network_security_rule" "allow_health_probe_inbound" {
  name                        = "allow_health_probe_inbound"
  priority                    = 1040
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "AzureLoadBalancer"
  destination_address_prefix  = "10.173.225.192/27"
  resource_group_name         = var.settings.resource_group_name
  network_security_group_name = var.settings.network_security_group_name
}

resource "azurerm_network_security_rule" "allow_tds_inbound" {
  name                        = "allow_tds_inbound"
  priority                    = 1050
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "10.173.225.192/27"
  destination_address_prefix  = "10.173.225.192/27"
  resource_group_name         = var.settings.resource_group_name
  network_security_group_name = var.settings.network_security_group_name
}

resource "azurerm_network_security_rule" "deny_all_inbound" {
  name                        = "deny_all_inbound"
  priority                    = 4096
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.settings.resource_group_name
  network_security_group_name = var.settings.network_security_group_name
}

resource "azurerm_network_security_rule" "allow_management_outbound" {
  name                        = "allow_management_outbound"
  priority                    = 1000
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges     = ["80", "443", "12000"]
  source_address_prefix       = "*"
  destination_address_prefix  = "AzureCloud"
  resource_group_name         = var.settings.resource_group_name
  network_security_group_name = var.settings.network_security_group_name
}

resource "azurerm_network_security_rule" "deny_all_outbound" {
  name                        = "deny_all_outbound"
  priority                    = 4096
  direction                   = "Outbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.settings.resource_group_name
  network_security_group_name = var.settings.network_security_group_name
}
*/

resource "azurerm_network_security_rule" "nsg_rules" {
  network_security_group_name                = var.settings.network_security_group_name
  resource_group_name                        = var.settings.resource_group_name
  for_each                                   = (var.settings.security_rule == null) ? {} : var.settings.security_rule
  name                                       = each.key
  description                                = each.value.description
  priority                                   = each.value.priority
  direction                                  = each.value.direction
  access                                     = each.value.access
  protocol                                   = each.value.protocol
  source_port_range                          = each.value.source_port_range
  destination_port_range                     = each.value.destination_port_range
  source_address_prefix                      = each.value.source_address_prefix
  destination_address_prefix                 = each.value.destination_address_prefix
  source_port_ranges                         = each.value.source_port_ranges
  destination_port_ranges                    = each.value.destination_port_ranges
  source_address_prefixes                    = each.value.source_address_prefixes
  destination_address_prefixes               = each.value.destination_address_prefixes
  source_application_security_group_ids      = each.value.source_application_security_group_ids
  destination_application_security_group_ids = each.value.destination_application_security_group_ids
}

resource "azurerm_route_table" "sqlmi_route" {
  name                          = var.settings.route_table_name
  location                      = var.settings.location
  resource_group_name           = var.settings.resource_group_name
  disable_bgp_route_propagation = false
}

resource "azurerm_subnet_route_table_association" "subnet_route_associate" {
  subnet_id      = var.settings.subnet_id
  route_table_id = azurerm_route_table.sqlmi_route.id
}

resource "azurerm_mssql_managed_instance" "sqlmi" {
  name                = var.settings.name
  resource_group_name = var.settings.resource_group_name
  location            = var.settings.location

  license_type       = var.settings.license_type
  sku_name           = var.settings.sku_name
  storage_size_in_gb = var.settings.storage_size_in_gb
  subnet_id          = var.settings.subnet_id
  vcores             = var.settings.vcores

  administrator_login          = var.settings.administrator_login
  administrator_login_password = var.settings.administrator_login_password

  depends_on = [
    azurerm_network_security_rule.nsg_rules
  ]
}
