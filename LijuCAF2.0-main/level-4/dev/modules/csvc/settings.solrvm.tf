locals {
  configure_solrvm_resources = {
    settings = {
      name                = "vm-ott007-dev-ci1-cssssolr-0001"
      location            = "centralindia"
      resource_group_name = "rg-ott007-dev-ci1-csss-0001"
      admin_username      = "adminuser"
      size                = "Standard_D4s_v5"
      computer_name       = "ott007cssssolrdev"
      os_disk = {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }

      source_image_reference = {
        publisher = "nilespartnersinc1617691698386"
        offer     = "solr"
        sku       = "solr"
        version   = "latest"
      }
      plan = [{
        name      = "solr"
        product   = "solr"
        publisher = "nilespartnersinc1617691698386"
      }]

      network_interface = {
        name = "vm-ott007-dev-ci1-solr-0001-nic-0001"
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

  configure_solrvms_resources = {
    settings = {

      # ottkeper 0004 - 00006
      solrvm4 = {
        name                = "vm-ott007-dev-ci1-cssssolr-0004"
        location            = "centralindia"
        resource_group_name = "rg-ott007-dev-ci1-csss-0002"
        vm_size             = "Standard_D2lds_v5"

        storage_os_disk = {
          name              = "vm-ott007-dev-ci1-cssssolr-0004-osdisk-0001"
          os_type           = "Linux"
          caching           = "ReadWrite"
          create_option     = "FromImage"
          managed_disk_type = "StandardSSD_LRS"
        }

        storage_data_disk = [{
          name              = "vm-ott007-dev-ci1-cssssolr-0004-datadisk-0001"
          caching           = "ReadWrite"
          create_option     = "Empty"
          disk_size_gb      = 64
          lun               = 2
          managed_disk_type = "StandardSSD_LRS"
          },
          {
            name              = "vm-ott007-dev-ci1-cssssolr-0004-datadisk-0002"
            caching           = "ReadWrite"
            create_option     = "Empty"
            disk_size_gb      = 64
            lun               = 3
            managed_disk_type = "StandardSSD_LRS"
        }]

        storage_image_reference = "/subscriptions/075e61b7-0274-436e-85df-3fe6f5fb33a1/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/Ubuntu1804ZookeeperHardenedVM-Gimage/versions/0.0.1"


        plan = {
          publisher = "canonical"
          name      = "pro-18_04-lts-gen2"
          product   = "0001-com-ubuntu-pro-bionic"
        }

        os_profile = {
          computer_name  = "vm-ott007-dev-ci1-cssssolr-0004"
          admin_username = "testadmin"
          admin_password = "Azure@123456"
          custom_data    = filebase64("${path.module}/script/zookeeper1.sh")
        }

        network_interface = {
          name = "vm-ott007-dev-ci1-cssssolr-0004-nic-0001"
          ip_configuration = {
            subnet_id = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-app-0007"
          }
        }
      }



      solrvm5 = {
        name                = "vm-ott007-dev-ci1-cssssolr-0005"
        location            = "centralindia"
        resource_group_name = "rg-ott007-dev-ci1-csss-0002"
        vm_size             = "Standard_D2lds_v5"

        storage_os_disk = {
          name              = "vm-ott007-dev-ci1-cssssolr-0005-osdisk-0001"
          os_type           = "Linux"
          caching           = "ReadWrite"
          create_option     = "FromImage"
          managed_disk_type = "StandardSSD_LRS"
        }

        storage_data_disk = [{
          name              = "vm-ott007-dev-ci1-cssssolr-0005-datadisk-0001"
          caching           = "ReadWrite"
          create_option     = "Empty"
          disk_size_gb      = 64
          lun               = 2
          managed_disk_type = "StandardSSD_LRS"
          },
          {
            name              = "vm-ott007-dev-ci1-cssssolr-0005-datadisk-0002"
            caching           = "ReadWrite"
            create_option     = "Empty"
            disk_size_gb      = 64
            lun               = 3
            managed_disk_type = "StandardSSD_LRS"
        }]

        storage_image_reference = "/subscriptions/075e61b7-0274-436e-85df-3fe6f5fb33a1/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/Ubuntu1804ZookeeperHardenedVM-Gimage/versions/0.0.1"


        plan = {
          publisher = "canonical"
          name      = "pro-18_04-lts-gen2"
          product   = "0001-com-ubuntu-pro-bionic"
        }

        os_profile = {
          computer_name  = "vm-ott007-dev-ci1-cssssolr-0005"
          admin_username = "testadmin"
          admin_password = "Azure@123456"
          custom_data    = filebase64("${path.module}/script/zookeeper2.sh")
        }

        network_interface = {
          name = "vm-ott007-dev-ci1-cssssolr-0005-nic-0001"
          ip_configuration = {
            subnet_id = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-app-0007"
          }
        }
      }

      solrvm6 = {
        name                = "vm-ott007-dev-ci1-cssssolr-0006"
        location            = "centralindia"
        resource_group_name = "rg-ott007-dev-ci1-csss-0002"
        vm_size             = "Standard_D2lds_v5"

        storage_os_disk = {
          name              = "vm-ott007-dev-ci1-cssssolr-0006-osdisk-0001"
          os_type           = "Linux"
          caching           = "ReadWrite"
          create_option     = "FromImage"
          managed_disk_type = "StandardSSD_LRS"
        }

        storage_data_disk = [{
          name              = "vm-ott007-dev-ci1-cssssolr-0006-datadisk-0001"
          caching           = "ReadWrite"
          create_option     = "Empty"
          disk_size_gb      = 64
          lun               = 2
          managed_disk_type = "StandardSSD_LRS"
          },
          {
            name              = "vm-ott007-dev-ci1-cssssolr-0006-datadisk-0002"
            caching           = "ReadWrite"
            create_option     = "Empty"
            disk_size_gb      = 64
            lun               = 3
            managed_disk_type = "StandardSSD_LRS"
        }]

        storage_image_reference = "/subscriptions/075e61b7-0274-436e-85df-3fe6f5fb33a1/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/Ubuntu1804ZookeeperHardenedVM-Gimage/versions/0.0.1"


        plan = {
          publisher = "canonical"
          name      = "pro-18_04-lts-gen2"
          product   = "0001-com-ubuntu-pro-bionic"
        }

        os_profile = {
          computer_name  = "vm-ott007-dev-ci1-cssssolr-0006"
          admin_username = "testadmin"
          admin_password = "Azure@123456"
          custom_data    = filebase64("${path.module}/script/zookeeper3.sh")
        }

        network_interface = {
          name = "vm-ott007-dev-ci1-cssssolr-0006-nic-0001"
          ip_configuration = {
            subnet_id = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-app-0007"
          }
        }
      }




      # Tlog Vm 0007 to 0009

      solrvm7 = {
        name                = "vm-ott007-dev-ci1-cssssolr-0007"
        location            = "centralindia"
        resource_group_name = "rg-ott007-dev-ci1-csss-0002"
        vm_size             = "Standard_D2ds_v5"

        storage_os_disk = {
          name              = "vm-ott007-dev-ci1-cssssolr-0007-osdisk-0001"
          os_type           = "Linux"
          caching           = "ReadWrite"
          create_option     = "FromImage"
          managed_disk_type = "StandardSSD_LRS"
        }

        storage_data_disk = [{
          name              = "vm-ott007-dev-ci1-cssssolr-0007-datadisk-0001"
          caching           = "ReadWrite"
          create_option     = "Empty"
          disk_size_gb      = 64
          lun               = 2
          managed_disk_type = "StandardSSD_LRS"
          },
          {
            name              = "vm-ott007-dev-ci1-cssssolr-0007-datadisk-0002"
            caching           = "ReadWrite"
            create_option     = "Empty"
            disk_size_gb      = 64
            lun               = 3
            managed_disk_type = "StandardSSD_LRS"
        }]

        storage_image_reference = "/subscriptions/075e61b7-0274-436e-85df-3fe6f5fb33a1/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/Ubuntu1804SolrHardenedVM-Gimage/versions/0.0.1"


        plan = {
          publisher = "canonical"
          name      = "pro-18_04-lts-gen2"
          product   = "0001-com-ubuntu-pro-bionic"
        }

        os_profile = {
          computer_name  = "vm-ott007-dev-ci1-cssssolr-0007"
          admin_username = "testadmin"
          admin_password = "Azure@123456"
          custom_data    = filebase64("${path.module}/script/tlog.solr.in.sh")
        }

        network_interface = {
          name = "vm-ott007-dev-ci1-cssssolr-0007-nic-0001"
          ip_configuration = {
            subnet_id = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-app-0007"
          }
        }
      }

      solrvm8 = {
        name                = "vm-ott007-dev-ci1-cssssolr-0008"
        location            = "centralindia"
        resource_group_name = "rg-ott007-dev-ci1-csss-0002"
        vm_size             = "Standard_D2ds_v5"

        storage_os_disk = {
          name              = "vm-ott007-dev-ci1-cssssolr-0008-osdisk-0001"
          os_type           = "Linux"
          caching           = "ReadWrite"
          create_option     = "FromImage"
          managed_disk_type = "StandardSSD_LRS"
        }

        storage_data_disk = [{
          name              = "vm-ott007-dev-ci1-cssssolr-0008-datadisk-0001"
          caching           = "ReadWrite"
          create_option     = "Empty"
          disk_size_gb      = 64
          lun               = 2
          managed_disk_type = "StandardSSD_LRS"
          },
          {
            name              = "vm-ott007-dev-ci1-cssssolr-0008-datadisk-0002"
            caching           = "ReadWrite"
            create_option     = "Empty"
            disk_size_gb      = 64
            lun               = 3
            managed_disk_type = "StandardSSD_LRS"
        }]

        storage_image_reference = "/subscriptions/075e61b7-0274-436e-85df-3fe6f5fb33a1/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/Ubuntu1804SolrHardenedVM-Gimage/versions/0.0.1"


        plan = {
          publisher = "canonical"
          name      = "pro-18_04-lts-gen2"
          product   = "0001-com-ubuntu-pro-bionic"
        }

        os_profile = {
          computer_name  = "vm-ott007-dev-ci1-cssssolr-0008"
          admin_username = "testadmin"
          admin_password = "Azure@123456"
          custom_data    = filebase64("${path.module}/script/tlog.solr.in.sh")
        }

        network_interface = {
          name = "vm-ott007-dev-ci1-cssssolr-0008-nic-0001"
          ip_configuration = {
            subnet_id = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-app-0007"
          }
        }
      }

      solrvm9 = {
        name                = "vm-ott007-dev-ci1-cssssolr-0009"
        location            = "centralindia"
        resource_group_name = "rg-ott007-dev-ci1-csss-0002"
        vm_size             = "Standard_D2ds_v5"

        storage_os_disk = {
          name              = "vm-ott007-dev-ci1-cssssolr-0009-osdisk-0001"
          os_type           = "Linux"
          caching           = "ReadWrite"
          create_option     = "FromImage"
          managed_disk_type = "StandardSSD_LRS"
        }

        storage_data_disk = [{
          name              = "vm-ott007-dev-ci1-cssssolr-0009-datadisk-0001"
          caching           = "ReadWrite"
          create_option     = "Empty"
          disk_size_gb      = 64
          lun               = 2
          managed_disk_type = "StandardSSD_LRS"
          },
          {
            name              = "vm-ott007-dev-ci1-cssssolr-0009-datadisk-0002"
            caching           = "ReadWrite"
            create_option     = "Empty"
            disk_size_gb      = 64
            lun               = 3
            managed_disk_type = "StandardSSD_LRS"
        }]

        storage_image_reference = "/subscriptions/075e61b7-0274-436e-85df-3fe6f5fb33a1/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/Ubuntu1804SolrHardenedVM-Gimage/versions/0.0.1"


        plan = {
          publisher = "canonical"
          name      = "pro-18_04-lts-gen2"
          product   = "0001-com-ubuntu-pro-bionic"
        }

        os_profile = {
          computer_name  = "vm-ott007-dev-ci1-cssssolr-0009"
          admin_username = "testadmin"
          admin_password = "Azure@123456"
          custom_data    = filebase64("${path.module}/script/tlog.solr.in.sh")
        }

        network_interface = {
          name = "vm-ott007-dev-ci1-cssssolr-0009-nic-0001"
          ip_configuration = {
            subnet_id = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-app-0007"
          }
        }
      }



      #solr admin
      solrvm10 = {
        name                = "vm-ott007-dev-ci1-cssssolr-0010"
        location            = "centralindia"
        resource_group_name = "rg-ott007-dev-ci1-csss-0002"
        vm_size             = "Standard_D2lds_v5"

        storage_os_disk = {
          name              = "vm-ott007-dev-ci1-cssssolr-0010-osdisk-0001"
          os_type           = "Linux"
          caching           = "ReadWrite"
          create_option     = "FromImage"
          managed_disk_type = "StandardSSD_LRS"
        }

        storage_data_disk = [{
          name              = "vm-ott007-dev-ci1-cssssolr-0010-datadisk-0001"
          caching           = "ReadWrite"
          create_option     = "Empty"
          disk_size_gb      = 64
          lun               = 2
          managed_disk_type = "StandardSSD_LRS"
          },
          {
            name              = "vm-ott007-dev-ci1-cssssolr-0010-datadisk-0002"
            caching           = "ReadWrite"
            create_option     = "Empty"
            disk_size_gb      = 64
            lun               = 3
            managed_disk_type = "StandardSSD_LRS"
        }]

        storage_image_reference = "/subscriptions/075e61b7-0274-436e-85df-3fe6f5fb33a1/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/Ubuntu1804SolrHardenedVM-Gimage/versions/0.0.1"


        plan = {
          publisher = "canonical"
          name      = "pro-18_04-lts-gen2"
          product   = "0001-com-ubuntu-pro-bionic"
        }

        os_profile = {
          computer_name  = "vm-ott007-dev-ci1-cssssolr-0010"
          admin_username = "testadmin"
          admin_password = "Azure@123456"
          custom_data    = filebase64("${path.module}/script/zookeeper1.sh")
        }

        network_interface = {
          name = "vm-ott007-dev-ci1-cssssolr-0010-nic-0001"
          ip_configuration = {
            subnet_id = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-app-0007"
          }
        }
      }
    }
  }
}
