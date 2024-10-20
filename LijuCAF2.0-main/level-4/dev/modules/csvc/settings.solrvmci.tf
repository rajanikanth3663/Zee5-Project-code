locals {
  configure_vm_linux_cssssolr = {
    settings = {
      ott007-solrvmcs-Server = {
        name                = "vm-ott007-dev-ci1-cssssolr-0002"
        location            = "centralindia"
        resource_group_name = "rg-ott007-dev-ci1-csss-0002"
        vm_size             = "Standard_D2lds_v5"

        storage_os_disk = {
          name              = "vm-ott007-dev-ci1-cssssolr-0002-osdisk-0001"
          os_type           = "Linux"
          caching           = "ReadWrite"
          create_option     = "FromImage"
          managed_disk_type = "Standard_LRS"
        }

        storage_data_disk = [{
          name            = "vm-ott007-dev-ci1-cssssolr-0002-datadisk-0003"
          caching         = "ReadWrite"
          lun             = 2
          managed_disk_id = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0002/providers/Microsoft.Compute/disks/vm-ott007-dev-ci1-cssssolr-0002-datadisk-0003"
          },
          {
            name            = "vm-ott007-dev-ci1-cssssolr-0002-datadisk-0004"
            caching         = "ReadWrite"
            lun             = 3
            managed_disk_id = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0002/providers/Microsoft.Compute/disks/vm-ott007-dev-ci1-cssssolr-0002-datadisk-0004"
        }]

        storage_image_reference = "/subscriptions/075e61b7-0274-436e-85df-3fe6f5fb33a1/resourcegroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/SolrUbuntu1804HardenedImage"

        os_profile = {
          computer_name  = "vm-ott007-dev-ci1-cssssolr-0002"
          admin_username = "testadmin"
          admin_password = "Azure@123456"
          # custom_data    = filebase64("${path.module}/script/admin.solr.in.sh")
          custom_data = filebase64("${path.module}/script/solr1.sh")
        }

        network_interface = {
          name = "vm-ott007-dev-ci1-cssssolr-0002-nic-0001"
          ip_configuration = {
            subnet_id = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-data-0008"
          }
        }
      }
    }
  }
}
