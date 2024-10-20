locals {
  configure_mongovm_resources = {
    settings = {
      name                = "vm-ott007-dev-ci1-csssmongo-0001"
      location            = "centralindia"
      resource_group_name = "rg-ott007-dev-ci1-csss-0001"
      admin_username      = "adminuser"
      size                = "Standard_D4s_v5"
      computer_name       = "ott007csssmongodev"
      os_disk = {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }

      source_image_reference = {
        publisher = "articentgroupllc1635512619530"
        offer     = "mongodb-server-ubuntu-22-04"
        sku       = "mongodb-server-ubuntu-22-04"
        version   = "latest"
      }
      plan = [{
        name      = "mongodb-server-ubuntu-22-04"
        product   = "mongodb-server-ubuntu-22-04"
        publisher = "articentgroupllc1635512619530"
      }]

      network_interface = {
        name = "vm-ott007-dev-ci1-mongo-0001-nic-0001"
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
