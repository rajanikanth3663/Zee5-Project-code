locals {
  configure_scyllavm_resources = {
    settings = {
      name                = "vm-ott007-dev-ci1-csssscylla-0001"
      location            = "centralindia"
      resource_group_name = "rg-ott007-dev-ci1-csss-0001"
      admin_username      = "adminuser"
      size                = "Standard_D4s_v5"
      computer_name       = "ott007cssscylladev"
      os_disk = {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }

      source_image_reference = {
        publisher = "canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts-gen2"
        version   = "latest"
      }

      network_interface = {
        name = "vm-ott007-np-ci1-scylla-0001-nic-0001"
        ip_configuration = {
          subnet_id = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-data-0008"
        }
      }
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
    }
  }
}




