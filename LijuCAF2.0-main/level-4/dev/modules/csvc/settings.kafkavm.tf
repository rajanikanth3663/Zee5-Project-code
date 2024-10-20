locals {
  configure_kafkavm_resources = {
    settings = {
      name                = "vm-ott007-dev-ci1-cssskafka-0001"
      location            = "centralindia"
      resource_group_name = "rg-ott007-dev-ci1-csss-0001"
      admin_username      = "adminuser"
      size                = "Standard_D2s_v5"
      computer_name       = "ott007cssskafkadev"
      os_disk = {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }

      source_image_reference = {
        publisher = "cloud-infrastructure-services"
        offer     = "kafka-ubuntu"
        sku       = "kafka-ubuntu-20-04"
        version   = "latest"
      }
      plan = [{
        name      = "kafka-ubuntu-20-04"
        product   = "kafka-ubuntu"
        publisher = "cloud-infrastructure-services"
      }]

      network_interface = {
        name = "vm-ott007-dev-ci1-kafka-0001-nic-0001"
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
