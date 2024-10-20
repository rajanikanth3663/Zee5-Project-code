locals {
  default_nsg_rules = {
    AllowAzureLoadBalancer = {
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "AzureLoadBalancer"
      destination_address_prefix = "*"
      priority                   = 4095
      access                     = "Allow"
      direction                  = "Inbound"
      protocol                   = "*"
    },
    DenyAllInBound = {
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "Internet"
      destination_address_prefix = "*"
      priority                   = 4096
      access                     = "Deny"
      direction                  = "Inbound"
      protocol                   = "*"
    },
    DenyAllOutBound = {
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "Internet"
      priority                   = 4096
      access                     = "Deny"
      direction                  = "Outbound"
      protocol                   = "*"
    },
    AllowVnetInBound = {
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
      priority                   = 400
      access                     = "Allow"
      direction                  = "Inbound"
      protocol                   = "*"
    },
    AllowVnetOutBound = {
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
      priority                   = 400
      access                     = "Allow"
      direction                  = "Outbound"
      protocol                   = "*"
    },
  }
  configure_nsg_resources = {
    settings = [
      {
        name                = "nsg-ott007-np-ci1-devops-0001"
        location            = "centralindia"
        resource_group_name = "rg-ott007-np-ci1-hubconnectivity-0001"
        tags = {
          "service-name"       = ""
          "BusinessUnit"       = ""
          "CostCenter"         = ""
          "DisasterRecovery"   = ""
          "environment"        = ""
          "OwnerName"          = ""
          "servicecriticality" = ""
          "ISV"                = ""
          "DataClassification" = ""
          "service-family"     = ""
          "ticket-id"          = ""
          "lead-spoc"          = ""
          "created_by"         = ""
          "Created_Date"       = ""
          "Updated_Date"       = ""
        },
        subnet_id     = "/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubconnectivity-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-np-ci1-hub-0001/subnets/snet-ott007-np-ci1-devops-0001"
        security_rule = local.default_nsg_rules
      },
      {
        name                = "nsg-ott007-np-ci1-devops-0002"
        location            = "centralindia"
        resource_group_name = "rg-ott007-np-ci1-hubconnectivity-0001"
        tags = {
          "service-name"       = ""
          "BusinessUnit"       = ""
          "CostCenter"         = ""
          "DisasterRecovery"   = ""
          "environment"        = ""
          "OwnerName"          = ""
          "servicecriticality" = ""
          "ISV"                = ""
          "DataClassification" = ""
          "service-family"     = ""
          "ticket-id"          = ""
          "lead-spoc"          = ""
          "created_by"         = ""
          "Created_Date"       = ""
          "Updated_Date"       = ""
        },
        subnet_id     = "/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubconnectivity-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-np-ci1-hub-0001/subnets/snet-ott007-np-ci1-devops-0002"
        security_rule = local.default_nsg_rules
      },
      {
        name                = "nsg-ott007-np-ci1-ampls-0003"
        location            = "centralindia"
        resource_group_name = "rg-ott007-np-ci1-hubconnectivity-0001"
        tags = {
          "service-name"       = ""
          "BusinessUnit"       = ""
          "CostCenter"         = ""
          "DisasterRecovery"   = ""
          "environment"        = ""
          "OwnerName"          = ""
          "servicecriticality" = ""
          "ISV"                = ""
          "DataClassification" = ""
          "service-family"     = ""
          "ticket-id"          = ""
          "lead-spoc"          = ""
          "created_by"         = ""
          "Created_Date"       = ""
          "Updated_Date"       = ""
        }
        subnet_id     = "/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubconnectivity-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-np-ci1-hub-0001/subnets/snet-ott007-np-ci1-ampls-0003"
        security_rule = local.default_nsg_rules
      }
    ]
  }
}
