locals {
  configure_vm_linux_customimage_resources = {
    settings = {
      csvcdis-0001 = {
        name                = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-dis-0001"
        location            = local.common.location
        resource_group_name = local.common.resource_group_name_csvc
        vm_size             = "Standard_D2s_v5"

        storage_os_disk = {
          name              = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-dis-0001-osdisk-0001"
          os_type           = "Linux"
          caching           = "ReadWrite"
          create_option     = "FromImage"
          managed_disk_type = "Standard_LRS"
        }

        storage_data_disk = [{
          name              = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-dis-0001-datadisk-0001"
          caching           = "ReadWrite"
          create_option     = "Empty"
          disk_size_gb      = 64
          lun               = 2
          managed_disk_type = "Standard_LRS"
        }]

        storage_image_reference = "/subscriptions/${local.sec_subscription_id}/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/Ubuntu2204Standard"

        os_profile = {
          computer_name  = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-dis-0001-0001"
          admin_username = "testadmin"
          admin_password = var.vm_admin_password
        }

        network_interface = {
          name = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-dis-0001-nic-0001"
          ip_configuration = {
            subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
          }
        }
      }

      "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-imgr-0001" = {
        name                = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-imgr-0001"
        location            = local.common.location
        resource_group_name = local.common.resource_group_name_csvc
        vm_size             = "Standard_D2s_v5"

        storage_os_disk = {
          name              = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-imgr-0001-0001"
          os_type           = "Linux"
          caching           = "ReadWrite"
          create_option     = "FromImage"
          managed_disk_type = "Standard_LRS"
        }


        storage_image_reference = "/subscriptions/${local.sec_subscription_id}/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/Ubuntu2204Standard/versions/0.0.1"

        os_profile = {
          computer_name  = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-imgr-0001-0001"
          admin_username = "testadmin"
          admin_password = var.vm_admin_password
        }

        network_interface = {
          name = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-imgr-0001-nic-0001"
          ip_configuration = {
            subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
          }
        }
      }

      ##Scylla cluster
      # xx77-scylladb-001 = {
      #   name                = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcscydb-0001"
      #   location            = local.common.location
      #   resource_group_name = local.common.resource_group_name_csvc
      #   vm_size             = "Standard_D16s_v5"

      #   storage_os_disk = {
      #     name              = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcscydb-0001-osdisk-0001"
      #     os_type           = "Linux"
      #     caching           = "ReadWrite"
      #     create_option     = "FromImage"
      #     managed_disk_type = "Standard_LRS"
      #   }


      #   storage_image_reference = "/subscriptions/${local.sec_subscription_id}/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/ScyllaDBvm_gimage/versions/0.0.1"

      #   os_profile = {
      #     computer_name  = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcscydb-0001"
      #     admin_username = "testadmin"
      #     admin_password = var.vm_admin_password
      #   }
      #   storage_data_disk = [{
      #     name              = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcscydb-0001-datadisk-0001"
      #     caching           = "ReadWrite"
      #     create_option     = "Empty"
      #     disk_size_gb      = 128
      #     lun               = 2
      #     managed_disk_type = "StandardSSD_LRS"
      #     },

      #     {
      #       name              = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcscydb-0001-datadisk-0002"
      #       caching           = "ReadWrite"
      #       create_option     = "Empty"
      #       disk_size_gb      = 128
      #       lun               = 3
      #       managed_disk_type = "StandardSSD_LRS"
      #     }

      #   ]

      #   network_interface = {
      #     name = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcscydb-0001-nic-0001"
      #     ip_configuration = {
      #       subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"
      #     }
      #   }
      # }

      # xx77-scylladb-002 = {
      #   name                = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcscydb-0002"
      #   location            = local.common.location
      #   resource_group_name = local.common.resource_group_name_csvc
      #   vm_size             = "Standard_D16s_v5"

      #   storage_os_disk = {
      #     name              = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcscydb-0002-osdisk-0001"
      #     os_type           = "Linux"
      #     caching           = "ReadWrite"
      #     create_option     = "FromImage"
      #     managed_disk_type = "Standard_LRS"
      #   }
      #   storage_data_disk = [{
      #     name              = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcscydb-0002-datadisk-0001"
      #     caching           = "ReadWrite"
      #     create_option     = "Empty"
      #     disk_size_gb      = 128
      #     lun               = 2
      #     managed_disk_type = "StandardSSD_LRS"
      #     },

      #     {
      #       name              = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcscydb-0002-datadisk-0002"
      #       caching           = "ReadWrite"
      #       create_option     = "Empty"
      #       disk_size_gb      = 128
      #       lun               = 3
      #       managed_disk_type = "StandardSSD_LRS"
      #     }

      #   ]


      #   storage_image_reference = "/subscriptions/${local.sec_subscription_id}/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/ScyllaDBvm_gimage/versions/0.0.1"

      #   os_profile = {
      #     computer_name  = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcscydb-0002"
      #     admin_username = "testadmin"
      #     admin_password = var.vm_admin_password
      #   }

      #   network_interface = {
      #     name = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcscydb-0002-nic-0001"
      #     ip_configuration = {
      #       subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"
      #     }
      #   }
      # }

      # xx77-scylladb-003 = {
      #   name                = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcscydb-0003"
      #   location            = local.common.location
      #   resource_group_name = local.common.resource_group_name_csvc
      #   vm_size             = "Standard_D16s_v5"

      #   storage_os_disk = {
      #     name              = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcscydb-0003-osdisk-0001"
      #     os_type           = "Linux"
      #     caching           = "ReadWrite"
      #     create_option     = "FromImage"
      #     managed_disk_type = "Standard_LRS"
      #   }
      #   storage_data_disk = [{
      #     name              = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcscydb-0003-datadisk-0001"
      #     caching           = "ReadWrite"
      #     create_option     = "Empty"
      #     disk_size_gb      = 128
      #     lun               = 2
      #     managed_disk_type = "StandardSSD_LRS"
      #     },

      #     {
      #       name              = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcscydb-0003-datadisk-0002"
      #       caching           = "ReadWrite"
      #       create_option     = "Empty"
      #       disk_size_gb      = 128
      #       lun               = 3
      #       managed_disk_type = "StandardSSD_LRS"
      #   }]

      #   storage_image_reference = "/subscriptions/${local.sec_subscription_id}/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/ScyllaDBvm_gimage/versions/0.0.1"

      #   os_profile = {
      #     computer_name  = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcscydb-0003"
      #     admin_username = "testadmin"
      #     admin_password = var.vm_admin_password
      #   }

      #   network_interface = {
      #     name = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcscydb-0003-nic-0001"
      #     ip_configuration = {
      #       subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"
      #     }
      #   }
      # }
      # xx77-scylladb-repair = {
      #   name                = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-sycllarepair"
      #   location            = local.common.location
      #   resource_group_name = local.common.resource_group_name_csvc
      #   vm_size             = "Standard_D4s_v5"

      #   storage_os_disk = {
      #     name              = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-sycllarepair-osdisk-0001"
      #     os_type           = "Linux"
      #     caching           = "ReadWrite"
      #     create_option     = "FromImage"
      #     managed_disk_type = "Standard_LRS"
      #   }

      #   storage_image_reference = "/subscriptions/${local.sec_subscription_id}/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/ScyllaDBvm_gimage/versions/0.0.1"

      #   os_profile = {
      #     computer_name  = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-sycllarepair"
      #     admin_username = "testadmin"
      #     admin_password = var.vm_admin_password
      #   }

      #   network_interface = {
      #     name = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-sycllarepair-nic-0001"
      #     ip_configuration = {
      #       subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"
      #     }
      #   }
      # }

      ##Solr
      # xx77keper 0004 - 00006
      solrvm4 = {
        name                = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0004"
        location            = local.common.location
        resource_group_name = "${local.common.resource_group_name_csvc02}"
        vm_size             = "Standard_D2lds_v5"

        storage_os_disk = {
          name              = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0004-osdisk-0001"
          os_type           = "Linux"
          caching           = "ReadWrite"
          create_option     = "FromImage"
          managed_disk_type = "StandardSSD_LRS"
        }

        storage_data_disk = [{
          name              = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0004-datadisk-0001"
          caching           = "ReadWrite"
          create_option     = "Empty"
          disk_size_gb      = 64
          lun               = 2
          managed_disk_type = "StandardSSD_LRS"
          },
          {
            name              = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0004-datadisk-0002"
            caching           = "ReadWrite"
            create_option     = "Empty"
            disk_size_gb      = 64
            lun               = 3
            managed_disk_type = "StandardSSD_LRS"
        }]

        storage_image_reference = "/subscriptions/${local.sec_subscription_id}/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/Ubuntu1804ZookeeperHardenedVM-Gimage/versions/0.0.1"


        plan = {
          publisher = "canonical"
          name      = "pro-18_04-lts-gen2"
          product   = "0001-com-ubuntu-pro-bionic"
        }

        os_profile = {
          computer_name  = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0004"
          admin_username = "testadmin"
          admin_password = var.vm_admin_password
          custom_data    = filebase64("${path.module}/script/zookeeper1.sh")
        }

        network_interface = {
          name = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0004-nic-0001"
          ip_configuration = {
            subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
          }
        }
      }



      solrvm5 = {
        name                = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0005"
        location            = local.common.location
        resource_group_name = "${local.common.resource_group_name_csvc02}"
        vm_size             = "Standard_D2lds_v5"

        storage_os_disk = {
          name              = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0005-osdisk-0001"
          os_type           = "Linux"
          caching           = "ReadWrite"
          create_option     = "FromImage"
          managed_disk_type = "StandardSSD_LRS"
        }

        storage_data_disk = [{
          name              = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0005-datadisk-0001"
          caching           = "ReadWrite"
          create_option     = "Empty"
          disk_size_gb      = 64
          lun               = 2
          managed_disk_type = "StandardSSD_LRS"
          },
          {
            name              = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0005-datadisk-0002"
            caching           = "ReadWrite"
            create_option     = "Empty"
            disk_size_gb      = 64
            lun               = 3
            managed_disk_type = "StandardSSD_LRS"
        }]

        storage_image_reference = "/subscriptions/${local.sec_subscription_id}/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/Ubuntu1804ZookeeperHardenedVM-Gimage/versions/0.0.1"


        plan = {
          publisher = "canonical"
          name      = "pro-18_04-lts-gen2"
          product   = "0001-com-ubuntu-pro-bionic"
        }

        os_profile = {
          computer_name  = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0005"
          admin_username = "testadmin"
          admin_password = var.vm_admin_password
          custom_data    = filebase64("${path.module}/script/zookeeper2.sh")
        }

        network_interface = {
          name = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0005-nic-0001"
          ip_configuration = {
            subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
          }
        }
      }

      solrvm6 = {
        name                = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0006"
        location            = local.common.location
        resource_group_name = local.common.resource_group_name_csvc02
        vm_size             = "Standard_D2lds_v5"

        storage_os_disk = {
          name              = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0006-osdisk-0001"
          os_type           = "Linux"
          caching           = "ReadWrite"
          create_option     = "FromImage"
          managed_disk_type = "StandardSSD_LRS"
        }

        storage_data_disk = [{
          name              = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0006-datadisk-0001"
          caching           = "ReadWrite"
          create_option     = "Empty"
          disk_size_gb      = 64
          lun               = 2
          managed_disk_type = "StandardSSD_LRS"
          },
          {
            name              = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0006-datadisk-0002"
            caching           = "ReadWrite"
            create_option     = "Empty"
            disk_size_gb      = 64
            lun               = 3
            managed_disk_type = "StandardSSD_LRS"
        }]

        storage_image_reference = "/subscriptions/${local.sec_subscription_id}/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/Ubuntu1804ZookeeperHardenedVM-Gimage/versions/0.0.1"


        plan = {
          publisher = "canonical"
          name      = "pro-18_04-lts-gen2"
          product   = "0001-com-ubuntu-pro-bionic"
        }

        os_profile = {
          computer_name  = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0006"
          admin_username = "testadmin"
          admin_password = var.vm_admin_password
          custom_data    = filebase64("${path.module}/script/zookeeper3.sh")
        }

        network_interface = {
          name = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0006-nic-0001"
          ip_configuration = {
            subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
          }
        }
      }




      # Tlog Vm 0007 to 0009

      solrvm7 = {
        name                = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0007"
        location            = local.common.location
        resource_group_name = local.common.resource_group_name_csvc02
        vm_size             = "Standard_D2ds_v5"

        storage_os_disk = {
          name              = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0007-osdisk-0001"
          os_type           = "Linux"
          caching           = "ReadWrite"
          create_option     = "FromImage"
          managed_disk_type = "StandardSSD_LRS"
        }

        storage_data_disk = [{
          name              = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0007-datadisk-0001"
          caching           = "ReadWrite"
          create_option     = "Empty"
          disk_size_gb      = 64
          lun               = 2
          managed_disk_type = "StandardSSD_LRS"
          },
          {
            name              = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0007-datadisk-0002"
            caching           = "ReadWrite"
            create_option     = "Empty"
            disk_size_gb      = 64
            lun               = 3
            managed_disk_type = "StandardSSD_LRS"
        }]

        storage_image_reference = "/subscriptions/${local.sec_subscription_id}/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/Ubuntu1804SolrHardenedVM-Gimage/versions/0.0.1"


        plan = {
          publisher = "canonical"
          name      = "pro-18_04-lts-gen2"
          product   = "0001-com-ubuntu-pro-bionic"
        }

        os_profile = {
          computer_name  = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0007"
          admin_username = "testadmin"
          admin_password = var.vm_admin_password
          custom_data    = filebase64("${path.module}/script/tlog.solr.in.sh")
        }

        network_interface = {
          name = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0007-nic-0001"
          ip_configuration = {
            subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
          }
        }
      }

      solrvm8 = {
        name                = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0008"
        location            = local.common.location
        resource_group_name = local.common.resource_group_name_csvc02
        vm_size             = "Standard_D2ds_v5"

        storage_os_disk = {
          name              = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0008-osdisk-0001"
          os_type           = "Linux"
          caching           = "ReadWrite"
          create_option     = "FromImage"
          managed_disk_type = "StandardSSD_LRS"
        }

        storage_data_disk = [{
          name              = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0008-datadisk-0001"
          caching           = "ReadWrite"
          create_option     = "Empty"
          disk_size_gb      = 64
          lun               = 2
          managed_disk_type = "StandardSSD_LRS"
          },
          {
            name              = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0008-datadisk-0002"
            caching           = "ReadWrite"
            create_option     = "Empty"
            disk_size_gb      = 64
            lun               = 3
            managed_disk_type = "StandardSSD_LRS"
        }]

        storage_image_reference = "/subscriptions/${local.sec_subscription_id}/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/Ubuntu1804SolrHardenedVM-Gimage/versions/0.0.1"


        plan = {
          publisher = "canonical"
          name      = "pro-18_04-lts-gen2"
          product   = "0001-com-ubuntu-pro-bionic"
        }

        os_profile = {
          computer_name  = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0008"
          admin_username = "testadmin"
          admin_password = var.vm_admin_password
          custom_data    = filebase64("${path.module}/script/tlog.solr.in.sh")
        }

        network_interface = {
          name = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0008-nic-0001"
          ip_configuration = {
            subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
          }
        }
      }

      solrvm9 = {
        name                = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0009"
        location            = local.common.location
        resource_group_name = local.common.resource_group_name_csvc02
        vm_size             = "Standard_D2ds_v5"

        storage_os_disk = {
          name              = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0009-osdisk-0001"
          os_type           = "Linux"
          caching           = "ReadWrite"
          create_option     = "FromImage"
          managed_disk_type = "StandardSSD_LRS"
        }

        storage_data_disk = [{
          name              = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0009-datadisk-0001"
          caching           = "ReadWrite"
          create_option     = "Empty"
          disk_size_gb      = 64
          lun               = 2
          managed_disk_type = "StandardSSD_LRS"
          },
          {
            name              = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0009-datadisk-0002"
            caching           = "ReadWrite"
            create_option     = "Empty"
            disk_size_gb      = 64
            lun               = 3
            managed_disk_type = "StandardSSD_LRS"
        }]

        storage_image_reference = "/subscriptions/${local.sec_subscription_id}/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/Ubuntu1804SolrHardenedVM-Gimage/versions/0.0.1"


        plan = {
          publisher = "canonical"
          name      = "pro-18_04-lts-gen2"
          product   = "0001-com-ubuntu-pro-bionic"
        }

        os_profile = {
          computer_name  = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0009"
          admin_username = "testadmin"
          admin_password = var.vm_admin_password
          custom_data    = filebase64("${path.module}/script/tlog.solr.in.sh")
        }

        network_interface = {
          name = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0009-nic-0001"
          ip_configuration = {
            subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
          }
        }
      }
      "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-medthek-0001" = {
        name                = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-medthek-0001"
        location            = local.common.location
        resource_group_name = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-medthek-0001"
        vm_size             = "Standard_D16ds_v5"

        storage_os_disk = {
          name              = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-medthek-0001-osdisk-0001"
          os_type           = "Linux"
          caching           = "ReadWrite"
          create_option     = "FromImage"
          managed_disk_type = "Standard_LRS"
        }
        storage_image_reference = "/subscriptions/${local.sec_subscription_id}/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/Ubuntu2204Standard"

        os_profile = {
          computer_name  = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-medthek-0001"
          admin_username = "testadmin"
          admin_password = var.vm_admin_password
        }

        managed_disk = {
          name                 = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-medthek-0001-datadisk-0001"
          storage_account_type = "Standard_LRS"
          create_option        = "Empty"
          disk_size_gb         = 1700
          lun                  = 0
          caching              = "ReadWrite"
        }

        network_interface = {
          name = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-medthek-0001-nic-0001"
          ip_configuration = {
            subnet_id            = "/subscriptions/${local.subscription_id}/resourceGroups/rg-${local.common.bu_name}-${local.common.dep_env}-ci1-medthek-0001/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-medthek-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-medthekapp-0001"
            public_ip_address_id = module.public-ip["mediathekpip1"].id
            # public_ip_address_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-${local.common.bu_name}-${local.common.dep_env}-ci1-medthek-0001/providers/Microsoft.Network/publicIPAddresses/pip-${local.common.bu_name}-${local.common.dep_env}-ci1-medthek--0001"
          }
        }
      }

    }
  }
}
