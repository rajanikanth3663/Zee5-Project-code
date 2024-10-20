locals {
  configure_vm_linux_customimage = {
    settings = {
      csssmongo-0002 = {
        name                = "vm-ott007-dev-ci1-csssmongo-0002"
        location            = "centralindia"
        resource_group_name = "rg-ott007-dev-ci1-csss-0001"
        vm_size             = "Standard_D2s_v5"

        storage_os_disk = {
          name              = "vm-ott007-dev-ci1-csssmongo-0002-osdisk-0001"
          os_type           = "Linux"
          caching           = "ReadWrite"
          create_option     = "FromImage"
          managed_disk_type = "Standard_LRS"
        }
        storage_image_reference = "/subscriptions/075e61b7-0274-436e-85df-3fe6f5fb33a1/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/Ubuntu2204Standard"

        os_profile = {
          computer_name  = "vm-ott007-dev-ci1-csssmongo-0002"
          admin_username = "testadmin"
          admin_password = "Azure@123456"
        }

        network_interface = {
          name = "vm-ott007-dev-ci1-csssmongo-0002-nic-0001"
          ip_configuration = {
            subnet_id = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-data-0008"
          }
        }
        storage_data_disk = [{
          name              = "vm-ott007-dev-ci1-csssmongo-0002-datadisk-0001"
          caching           = "ReadWrite"
          create_option     = "Empty"
          disk_size_gb      = 64
          lun               = 2
          managed_disk_type = "Standard_LRS"
        }]
      }




      csssmongo-0003 = {
        name                = "vm-ott007-dev-ci1-csssmongo-0003"
        location            = "centralindia"
        resource_group_name = "rg-ott007-dev-ci1-csss-0001"
        vm_size             = "Standard_D2s_v5"

        storage_os_disk = {
          name              = "vm-ott007-dev-ci1-csssmongo-0003-osdisk-0001"
          os_type           = "Linux"
          caching           = "ReadWrite"
          create_option     = "FromImage"
          managed_disk_type = "Standard_LRS"
        }
        storage_data_disk = [{
          name              = "vm-ott007-dev-ci1-csssmongo-0003-datadisk-0001"
          caching           = "ReadWrite"
          create_option     = "Empty"
          disk_size_gb      = 64
          lun               = 2
          managed_disk_type = "Standard_LRS"
        }]


        storage_image_reference = "/subscriptions/075e61b7-0274-436e-85df-3fe6f5fb33a1/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/Ubuntu2204Standard"

        os_profile = {
          computer_name  = "vm-ott007-dev-ci1-csssmongo-0003"
          admin_username = "testadmin"
          admin_password = "Azure@123456"
        }

        network_interface = {
          name = "vm-ott007-dev-ci1-csssmongo-0003-nic-0001"
          ip_configuration = {
            subnet_id = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-data-0008"
          }
        }
      }

      csssmongo-0004 = {
        name                = "vm-ott007-dev-ci1-csssmongo-0004"
        location            = "centralindia"
        resource_group_name = "rg-ott007-dev-ci1-csss-0001"
        vm_size             = "Standard_D2s_v5"

        storage_os_disk = {
          name              = "vm-ott007-dev-ci1-csssmongo-0004-osdisk-0001"
          os_type           = "Linux"
          caching           = "ReadWrite"
          create_option     = "FromImage"
          managed_disk_type = "Standard_LRS"
        }
        #
        storage_data_disk = [{
          name              = "vm-ott007-dev-ci1-csssmongo-0004-datadisk-0001"
          caching           = "ReadWrite"
          create_option     = "Empty"
          disk_size_gb      = 64
          lun               = 2
          managed_disk_type = "Standard_LRS"
        }]

        storage_image_reference = "/subscriptions/075e61b7-0274-436e-85df-3fe6f5fb33a1/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/Ubuntu2204Standard"

        os_profile = {
          computer_name  = "vm-ott007-dev-ci1-csssmongo-0004"
          admin_username = "testadmin"
          admin_password = "Azure@123456"
        }

        network_interface = {
          name = "vm-ott007-dev-ci1-csssmongo-0004-nic-0001"
          ip_configuration = {
            subnet_id = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-data-0008"
          }
        }
      }

      csssdis-0001 = {
        name                = "vm-ott007-dev-ci1-csss-dis-0001"
        location            = "centralindia"
        resource_group_name = "rg-ott007-dev-ci1-csss-0001"
        vm_size             = "Standard_D2s_v5"

        storage_os_disk = {
          name              = "vm-ott007-dev-ci1-csss-dis-0001-osdisk-0001"
          os_type           = "Linux"
          caching           = "ReadWrite"
          create_option     = "FromImage"
          managed_disk_type = "Standard_LRS"
        }

        storage_data_disk = [{
          name              = "vm-ott007-dev-ci1-csss-dis-0001-datadisk-0001"
          caching           = "ReadWrite"
          create_option     = "Empty"
          disk_size_gb      = 64
          lun               = 2
          managed_disk_type = "Standard_LRS"
        }]

        storage_image_reference = "/subscriptions/075e61b7-0274-436e-85df-3fe6f5fb33a1/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/Ubuntu2204Standard"

        os_profile = {
          computer_name  = "vm-ott007-dev-ci1-csss-dis-0001-0001"
          admin_username = "testadmin"
          admin_password = "Azure@123456"
        }

        network_interface = {
          name = "vm-ott007-dev-ci1-csss-dis-0001-nic-0001"
          ip_configuration = {
            subnet_id = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-app-0007"
          }
        }
      }
    }
  }
}

