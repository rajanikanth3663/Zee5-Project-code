locals {
  configure_vm_linux_resources = {
    settings = {
      name                = "vm-ott007-np-ci1-runner-0001"
      location            = "centralindia"
      resource_group_name = "rg-ott007-np-ci1-hubdevops-0001"
      admin_username      = "adminuser"
      size                = "Standard_DS2_v2"
      computer_name       = "ott007nprunner"
      os_disk = {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }

      source_image_reference = {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-focal"
        sku       = "20_04-lts"
        version   = "latest"
      }

      network_interface = {
        name = "vm-ott007-np-ci1-runner-0001-nic-0001"
        ip_configuration = {
          subnet_id = "/subscriptions/subs-xxxxx-xxxx/resourceGroups/rg-ott007-np-ci1-hubconnectivity-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-np-ci1-hub-0001/subnets/snet-ott007-np-ci1-devops-0001"
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
