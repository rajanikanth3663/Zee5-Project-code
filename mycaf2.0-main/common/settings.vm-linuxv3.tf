locals {
  configure_vm_linux_customimagev3 = {
    settings = {

      kafka0001 = {
        name                = "kafka-0001"
        location            = local.common.location
        resource_group_name = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_adtek}-0001"
        vm_size             = "Standard_D2lds_v5"
        environment         = "${local.common.dep_env}"
        zone                = [1]
        # boot_storage_account = data.azurerm_storage_account.bootsa.primary_blob_endpoint
        boot_storage_account = module.storage-account["st${local.common.bu_name}${local.common.app_name_adtek}${local.common.dep_env}ci1boot002"].primary_blob_endpoint

        storage_os_disk = {
          name              = "osdisk"
          os_type           = "Linux"
          caching           = "ReadWrite"
          create_option     = "FromImage"
          managed_disk_type = "StandardSSD_LRS"
        }

        storage_image_reference = "/subscriptions/${local.sec_subscription_id}/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/Ubuntu2204Standard/versions/0.0.1"

        os_profile = {
          computer_name  = "computername"
          admin_username = "vmadmin"
          admin_password = var.vm_admin_password
        }

        os_profile_linux_config = {
          ssh_keys = {
            # key_data = file("${path.module}/ssh/vm.pub")
            key_data = file("${path.module}/ssh/vm.pub")
            path     = "/home/vmadmin/.ssh/authorized_keys"
          }
        }

        managed_disk = [
          {
            name                          = "datadisk-0001"
            storage_account_type          = "StandardSSD_LRS"
            create_option                 = "Empty"
            disk_size_gb                  = 64
            lun                           = 0
            zone                          = "1"
            caching                       = "ReadWrite"
            network_access_policy         = "DenyAll"
            public_network_access_enabled = false
          },
          {
            name                          = "datadisk-0002"
            storage_account_type          = "StandardSSD_LRS"
            create_option                 = "Empty"
            disk_size_gb                  = 64
            lun                           = 1
            zone                          = "1"
            caching                       = "ReadWrite"
            network_access_policy         = "DenyAll"
            public_network_access_enabled = false
          }
        ]

        network_interface = {
          name = "nic-0001"
          ip_configuration = {
            subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
          }
        }

        vm_extension = {
          name                 = "ext-mountdisks-configure-kafka"
          mount_point_name     = "mnt1"
          file_system          = "ext4"
          disk_partition       = "sdc"
          csfile               = "${path.module}/script/kafka-server.tftpl"
          storage_account_name = module.storage-account["${local.common.app_name_adtech}storage1"].storage_account_name
          storage_account_key  = module.storage-account["${local.common.app_name_adtech}storage1"].primary_access_key
          storage_uri          = module.storage-account["${local.common.app_name_adtech}storage1"].primary_blob_endpoint
          fileUris             = "software-config-files/kafka_2.12-3.4.1.tgz,software-config-files/Python-3.6.0.tar.xz,software-config-files/spark-3.4.1-bin-hadoop3.tgz,software-config-files/apache-druid-26.0.0-bin.tar.gz"
        }
      }

      etl0001 = {
        name                 = "etl-0001"
        location             = local.common.location
        resource_group_name  = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_adtek}-0001"
        vm_size              = "Standard_D2lds_v5"
        environment          = "${local.common.dep_env}"
        zone                 = [1]
        boot_storage_account = module.storage-account["st${local.common.bu_name}${local.common.app_name_adtek}${local.common.dep_env}ci1boot002"].primary_blob_endpoint

        storage_os_disk = {
          name              = "osdisk"
          os_type           = "Linux"
          caching           = "ReadWrite"
          create_option     = "FromImage"
          managed_disk_type = "StandardSSD_LRS"
        }

        storage_image_reference = "/subscriptions/${local.sec_subscription_id}/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/Ubuntu2204Standard/versions/0.0.1"

        os_profile = {
          computer_name  = "computername"
          admin_username = "vmadmin"
          admin_password = var.vm_admin_password
        }

        os_profile_linux_config = {
          ssh_keys = {
            key_data = file("${path.module}/ssh/vm.pub")
            path     = "/home/vmadmin/.ssh/authorized_keys"
          }
        }

        managed_disk = [
          {
            name                          = "datadisk-0001"
            storage_account_type          = "StandardSSD_LRS"
            create_option                 = "Empty"
            disk_size_gb                  = 32
            lun                           = 0
            zone                          = "1"
            caching                       = "ReadWrite"
            network_access_policy         = "DenyAll"
            public_network_access_enabled = false
          },
          {
            name                          = "datadisk-0002"
            storage_account_type          = "StandardSSD_LRS"
            create_option                 = "Empty"
            disk_size_gb                  = 64
            lun                           = 1
            zone                          = "1"
            caching                       = "ReadWrite"
            network_access_policy         = "DenyAll"
            public_network_access_enabled = false
          }
        ]

        network_interface = {
          name = "nic-0001"
          ip_configuration = {
            subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
          }
        }

        vm_extension = {
          name                 = "ext-mountdisks-configure-etl-svr"
          mount_point_name     = "mnt1"
          file_system          = "ext4"
          disk_partition       = "sdc"
          csfile               = "${path.module}/script/etl-server.tftpl"
          storage_account_name = module.storage-account["${local.common.app_name_adtech}storage1"].storage_account_name
          storage_account_key  = module.storage-account["${local.common.app_name_adtech}storage1"].primary_access_key
          storage_uri          = module.storage-account["${local.common.app_name_adtech}storage1"].primary_blob_endpoint
          fileUris             = "software-config-files/kafka_2.12-3.4.1.tgz,software-config-files/Python-3.6.0.tar.xz,software-config-files/spark-3.4.1-bin-hadoop3.tgz,software-config-files/apache-druid-26.0.0-bin.tar.gz"
        }
      }

      rdbmsslave0001 = {
        name                 = "rdbms-slave-0001"
        location             = local.common.location
        resource_group_name  = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_adtek}-0001"
        vm_size              = "Standard_D2lds_v5"
        environment          = "${local.common.dep_env}"
        zone                 = [1]
        boot_storage_account = module.storage-account["st${local.common.bu_name}${local.common.app_name_adtek}${local.common.dep_env}ci1boot002"].primary_blob_endpoint

        storage_os_disk = {
          name              = "osdisk"
          os_type           = "Linux"
          caching           = "ReadWrite"
          create_option     = "FromImage"
          managed_disk_type = "StandardSSD_LRS"
        }

        storage_image_reference = "/subscriptions/${local.sec_subscription_id}/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/Ubuntu2204Standard/versions/0.0.1"

        os_profile = {
          computer_name  = "computername"
          admin_username = "vmadmin"
          admin_password = var.vm_admin_password
        }

        os_profile_linux_config = {
          ssh_keys = {
            key_data = file("${path.module}/ssh/vm.pub")
            path     = "/home/vmadmin/.ssh/authorized_keys"
          }
        }

        managed_disk = [
          {
            name                          = "datadisk-0001"
            storage_account_type          = "StandardSSD_LRS"
            create_option                 = "Empty"
            disk_size_gb                  = 64
            lun                           = 0
            zone                          = "1"
            caching                       = "ReadWrite"
            network_access_policy         = "DenyAll"
            public_network_access_enabled = false
          },
          {
            name                          = "datadisk-0002"
            storage_account_type          = "StandardSSD_LRS"
            create_option                 = "Empty"
            disk_size_gb                  = 64
            lun                           = 1
            zone                          = "1"
            caching                       = "ReadWrite"
            network_access_policy         = "DenyAll"
            public_network_access_enabled = false
          },
          {
            name                          = "datadisk-0003"
            storage_account_type          = "StandardSSD_LRS"
            create_option                 = "Empty"
            disk_size_gb                  = 64
            lun                           = 2
            zone                          = "1"
            caching                       = "ReadWrite"
            network_access_policy         = "DenyAll"
            public_network_access_enabled = false
          }
        ]

        network_interface = {
          name = "nic-0001"
          ip_configuration = {
            subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"
          }
        }

        vm_extension = {
          name                 = "ext-mountdisks-configure-rdbms-slave"
          mount_point_name     = "mnt1"
          file_system          = "ext4"
          disk_partition       = "sdc"
          csfile               = "${path.module}/script/rdbms-slave.tftpl"
          storage_account_name = module.storage-account["${local.common.app_name_adtech}storage1"].storage_account_name
          storage_account_key  = module.storage-account["${local.common.app_name_adtech}storage1"].primary_access_key
          storage_uri          = module.storage-account["${local.common.app_name_adtech}storage1"].primary_blob_endpoint
          fileUris             = "software-config-files/kafka_2.12-3.4.1.tgz,software-config-files/Python-3.6.0.tar.xz,software-config-files/spark-3.4.1-bin-hadoop3.tgz,software-config-files/apache-druid-26.0.0-bin.tar.gz"
        }
      }

      admin0001 = {
        name                 = "admin-0001"
        location             = local.common.location
        resource_group_name  = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_adtek}-0001"
        vm_size              = "Standard_D4lds_v5"
        environment          = "${local.common.dep_env}"
        zone                 = [1]
        boot_storage_account = module.storage-account["st${local.common.bu_name}${local.common.app_name_adtek}${local.common.dep_env}ci1boot002"].primary_blob_endpoint

        storage_os_disk = {
          name              = "osdisk"
          os_type           = "Linux"
          caching           = "ReadWrite"
          create_option     = "FromImage"
          managed_disk_type = "StandardSSD_LRS"
        }

        storage_image_reference = "/subscriptions/${local.sec_subscription_id}/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/Ubuntu2204Standard/versions/0.0.1"

        os_profile = {
          computer_name  = "computername"
          admin_username = "vmadmin"
          admin_password = var.vm_admin_password
        }

        os_profile_linux_config = {
          ssh_keys = {
            key_data = file("${path.module}/ssh/vm.pub")
            path     = "/home/vmadmin/.ssh/authorized_keys"
          }
        }

        managed_disk = [
          {
            name                          = "datadisk-0001"
            storage_account_type          = "StandardSSD_LRS"
            create_option                 = "Empty"
            disk_size_gb                  = 64
            lun                           = 0
            zone                          = "1"
            caching                       = "ReadWrite"
            network_access_policy         = "DenyAll"
            public_network_access_enabled = false
          }
        ]

        network_interface = {
          name = "nic-0001"
          ip_configuration = {
            subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
          }
        }

        vm_extension = {
          name                 = "ext-mountdisk-configure-admin-svr"
          mount_point_name     = "mnt1"
          file_system          = "ext4"
          disk_partition       = "sdc"
          csfile               = "${path.module}/script/admin-server.tftpl"
          storage_account_name = module.storage-account["${local.common.app_name_adtech}storage1"].storage_account_name
          storage_account_key  = module.storage-account["${local.common.app_name_adtech}storage1"].primary_access_key
          storage_uri          = module.storage-account["${local.common.app_name_adtech}storage1"].primary_blob_endpoint
          fileUris             = "software-config-files/kafka_2.12-3.4.1.tgz,software-config-files/Python-3.6.0.tar.xz,software-config-files/spark-3.4.1-bin-hadoop3.tgz,software-config-files/apache-druid-26.0.0-bin.tar.gz"
        }
      }

      datascience0001 = {
        name                 = "data-science-0001"
        location             = local.common.location
        resource_group_name  = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_adtek}-0001"
        vm_size              = "Standard_D4ds_v5"
        environment          = "${local.common.dep_env}"
        zone                 = [1]
        boot_storage_account = module.storage-account["st${local.common.bu_name}${local.common.app_name_adtek}${local.common.dep_env}ci1boot002"].primary_blob_endpoint

        storage_os_disk = {
          name              = "osdisk"
          os_type           = "Linux"
          caching           = "ReadWrite"
          create_option     = "FromImage"
          managed_disk_type = "StandardSSD_LRS"
        }

        storage_image_reference = "/subscriptions/${local.sec_subscription_id}/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/Ubuntu2204Standard/versions/0.0.1"

        os_profile = {
          computer_name  = "computername"
          admin_username = "vmadmin"
          admin_password = var.vm_admin_password
        }

        os_profile_linux_config = {
          ssh_keys = {
            key_data = file("${path.module}/ssh/vm.pub")
            path     = "/home/vmadmin/.ssh/authorized_keys"
          }
        }

        managed_disk = [
          {
            name                          = "datadisk-0001"
            storage_account_type          = "StandardSSD_LRS"
            create_option                 = "Empty"
            disk_size_gb                  = 64
            lun                           = 0
            zone                          = "1"
            caching                       = "ReadWrite"
            network_access_policy         = "DenyAll"
            public_network_access_enabled = false
          },
          {
            name                          = "datadisk-0002"
            storage_account_type          = "StandardSSD_LRS"
            create_option                 = "Empty"
            disk_size_gb                  = 64
            lun                           = 1
            zone                          = "1"
            caching                       = "ReadWrite"
            network_access_policy         = "DenyAll"
            public_network_access_enabled = false
          }
        ]

        network_interface = {
          name = "nic-0001"
          ip_configuration = {
            subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
          }
        }

        vm_extension = {
          name                 = "ext-mountdisks-configure-datasc-svr"
          mount_point_name     = "mnt1"
          file_system          = "ext4"
          disk_partition       = "sdc"
          csfile               = "${path.module}/script/data-science-server.tftpl"
          storage_account_name = module.storage-account["${local.common.app_name_adtech}storage1"].storage_account_name
          storage_account_key  = module.storage-account["${local.common.app_name_adtech}storage1"].primary_access_key
          storage_uri          = module.storage-account["${local.common.app_name_adtech}storage1"].primary_blob_endpoint
          fileUris             = "software-config-files/kafka_2.12-3.4.1.tgz,software-config-files/Python-3.6.0.tar.xz,software-config-files/spark-3.4.1-bin-hadoop3.tgz,software-config-files/apache-druid-26.0.0-bin.tar.gz"
        }
      }

      etlrcb0001 = {
        name                 = "etl-rcb-0001"
        location             = local.common.location
        resource_group_name  = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_adtek}-0001"
        vm_size              = "Standard_D4ds_v5"
        environment          = "${local.common.dep_env}"
        zone                 = [1]
        boot_storage_account = module.storage-account["st${local.common.bu_name}${local.common.app_name_adtek}${local.common.dep_env}ci1boot002"].primary_blob_endpoint

        storage_os_disk = {
          name              = "osdisk"
          os_type           = "Linux"
          caching           = "ReadWrite"
          create_option     = "FromImage"
          managed_disk_type = "StandardSSD_LRS"
        }

        storage_image_reference = "/subscriptions/${local.sec_subscription_id}/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/Ubuntu2204Standard/versions/0.0.1"

        os_profile = {
          computer_name  = "computername"
          admin_username = "vmadmin"
          admin_password = var.vm_admin_password
        }

        os_profile_linux_config = {
          ssh_keys = {
            key_data = file("${path.module}/ssh/vm.pub")
            path     = "/home/vmadmin/.ssh/authorized_keys"
          }
        }

        managed_disk = [
          {
            name                          = "datadisk-0001"
            storage_account_type          = "StandardSSD_LRS"
            create_option                 = "Empty"
            disk_size_gb                  = 32
            lun                           = 0
            zone                          = "1"
            caching                       = "ReadWrite"
            network_access_policy         = "DenyAll"
            public_network_access_enabled = false
          },
          {
            name                          = "datadisk-0002"
            storage_account_type          = "StandardSSD_LRS"
            create_option                 = "Empty"
            disk_size_gb                  = 64
            lun                           = 1
            zone                          = "1"
            caching                       = "ReadWrite"
            network_access_policy         = "DenyAll"
            public_network_access_enabled = false
          },
          {
            name                          = "datadisk-0003"
            storage_account_type          = "StandardSSD_LRS"
            create_option                 = "Empty"
            disk_size_gb                  = 64
            lun                           = 2
            zone                          = "1"
            caching                       = "ReadWrite"
            network_access_policy         = "DenyAll"
            public_network_access_enabled = false
          },
          {
            name                          = "datadisk-0004"
            storage_account_type          = "StandardSSD_LRS"
            create_option                 = "Empty"
            disk_size_gb                  = 64
            lun                           = 3
            zone                          = "1"
            caching                       = "ReadWrite"
            network_access_policy         = "DenyAll"
            public_network_access_enabled = false
          }
        ]

        network_interface = {
          name = "nic-0001"
          ip_configuration = {
            subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
          }
        }

        vm_extension = {
          name                 = "ext-mountdisks-configure-etl-rcb"
          mount_point_name     = "mnt1"
          file_system          = "ext4"
          disk_partition       = "sdc"
          csfile               = "${path.module}/script/etl-rcb-server.tftpl"
          storage_account_name = module.storage-account["${local.common.app_name_adtech}storage1"].storage_account_name
          storage_account_key  = module.storage-account["${local.common.app_name_adtech}storage1"].primary_access_key
          storage_uri          = module.storage-account["${local.common.app_name_adtech}storage1"].primary_blob_endpoint
          fileUris             = "software-config-files/kafka_2.12-3.4.1.tgz,software-config-files/Python-3.6.0.tar.xz,software-config-files/spark-3.4.1-bin-hadoop3.tgz,software-config-files/apache-druid-26.0.0-bin.tar.gz"
        }
      }

      rdbmsmaster0001 = {
        name                 = "rdbms-master-0001"
        location             = local.common.location
        resource_group_name  = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_adtek}-0001"
        vm_size              = "Standard_D2ds_v5"
        environment          = "${local.common.dep_env}"
        zone                 = [1]
        boot_storage_account = module.storage-account["st${local.common.bu_name}${local.common.app_name_adtek}${local.common.dep_env}ci1boot002"].primary_blob_endpoint

        storage_os_disk = {
          name              = "osdisk"
          os_type           = "Linux"
          caching           = "ReadWrite"
          create_option     = "FromImage"
          managed_disk_type = "StandardSSD_LRS"
        }

        storage_image_reference = "/subscriptions/${local.sec_subscription_id}/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/Ubuntu2204Standard/versions/0.0.1"

        os_profile = {
          computer_name  = "computername"
          admin_username = "vmadmin"
          admin_password = var.vm_admin_password
        }

        os_profile_linux_config = {
          ssh_keys = {
            key_data = file("${path.module}/ssh/vm.pub")
            path     = "/home/vmadmin/.ssh/authorized_keys"
          }
        }

        managed_disk = [
          {
            name                          = "datadisk-0001"
            storage_account_type          = "StandardSSD_LRS"
            create_option                 = "Empty"
            disk_size_gb                  = 32
            lun                           = 0
            zone                          = "1"
            caching                       = "ReadWrite"
            network_access_policy         = "DenyAll"
            public_network_access_enabled = false
          },
          {
            name                          = "datadisk-0002"
            storage_account_type          = "StandardSSD_LRS"
            create_option                 = "Empty"
            disk_size_gb                  = 64
            lun                           = 1
            zone                          = "1"
            caching                       = "ReadWrite"
            network_access_policy         = "DenyAll"
            public_network_access_enabled = false
          }
        ]

        network_interface = {
          name = "nic-0001"
          ip_configuration = {
            subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"
          }
        }

        vm_extension = {
          name                 = "ext-mountdisks-configure-rdbms-master"
          mount_point_name     = "mnt1"
          file_system          = "ext4"
          disk_partition       = "sdc"
          csfile               = "${path.module}/script/rdbms-master.tftpl"
          storage_account_name = module.storage-account["${local.common.app_name_adtech}storage1"].storage_account_name
          storage_account_key  = module.storage-account["${local.common.app_name_adtech}storage1"].primary_access_key
          storage_uri          = module.storage-account["${local.common.app_name_adtech}storage1"].primary_blob_endpoint
          fileUris             = "software-config-files/kafka_2.12-3.4.1.tgz,software-config-files/Python-3.6.0.tar.xz,software-config-files/spark-3.4.1-bin-hadoop3.tgz,software-config-files/apache-druid-26.0.0-bin.tar.gz"
        }
      }

      dbox0001 = {
        name                 = "dbox-0001"
        location             = local.common.location
        resource_group_name  = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_adtek}-0001"
        vm_size              = "Standard_D4lds_v5"
        environment          = "${local.common.dep_env}"
        zone                 = [1]
        boot_storage_account = module.storage-account["st${local.common.bu_name}${local.common.app_name_adtek}${local.common.dep_env}ci1boot002"].primary_blob_endpoint

        storage_os_disk = {
          name              = "osdisk"
          os_type           = "Linux"
          caching           = "ReadWrite"
          create_option     = "FromImage"
          managed_disk_type = "StandardSSD_LRS"
        }

        storage_image_reference = "/subscriptions/${local.sec_subscription_id}/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/Ubuntu2204Standard/versions/0.0.1"

        os_profile = {
          computer_name  = "computername"
          admin_username = "vmadmin"
          admin_password = var.vm_admin_password
        }

        os_profile_linux_config = {
          ssh_keys = {
            key_data = file("${path.module}/ssh/vm.pub")
            path     = "/home/vmadmin/.ssh/authorized_keys"
          }
        }

        managed_disk = [
          {
            name                          = "datadisk-0001"
            storage_account_type          = "StandardSSD_LRS"
            create_option                 = "Empty"
            disk_size_gb                  = 32
            lun                           = 0
            zone                          = "1"
            caching                       = "ReadWrite"
            network_access_policy         = "DenyAll"
            public_network_access_enabled = false
          }
        ]

        network_interface = {
          name = "nic-0001"
          ip_configuration = {
            subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
          }
        }

        vm_extension = {
          name                 = "ext-mountdisk-configure-dbox"
          mount_point_name     = "mnt1"
          file_system          = "ext4"
          disk_partition       = "sdc"
          csfile               = "${path.module}/script/dbox.tftpl"
          storage_account_name = module.storage-account["${local.common.app_name_adtech}storage1"].storage_account_name
          storage_account_key  = module.storage-account["${local.common.app_name_adtech}storage1"].primary_access_key
          storage_uri          = module.storage-account["${local.common.app_name_adtech}storage1"].primary_blob_endpoint
          fileUris             = "software-config-files/kafka_2.12-3.4.1.tgz,software-config-files/Python-3.6.0.tar.xz,software-config-files/spark-3.4.1-bin-hadoop3.tgz,software-config-files/apache-druid-26.0.0-bin.tar.gz"
        }
      }

      druid0001 = {
        name                 = "druid-0001"
        location             = local.common.location
        resource_group_name  = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_adtek}-0001"
        vm_size              = "Standard_D4ds_v5"
        environment          = "${local.common.dep_env}"
        zone                 = [1]
        boot_storage_account = module.storage-account["st${local.common.bu_name}${local.common.app_name_adtek}${local.common.dep_env}ci1boot002"].primary_blob_endpoint

        storage_os_disk = {
          name              = "osdisk"
          os_type           = "Linux"
          caching           = "ReadWrite"
          create_option     = "FromImage"
          managed_disk_type = "StandardSSD_LRS"
        }

        storage_image_reference = "/subscriptions/${local.sec_subscription_id}/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/Ubuntu2204Standard/versions/0.0.1"

        os_profile = {
          computer_name  = "computername"
          admin_username = "vmadmin"
          admin_password = var.vm_admin_password
        }

        os_profile_linux_config = {
          ssh_keys = {
            key_data = file("${path.module}/ssh/vm.pub")
            path     = "/home/vmadmin/.ssh/authorized_keys"
          }
        }

        managed_disk = [
          {
            name                          = "datadisk-0001"
            storage_account_type          = "StandardSSD_LRS"
            create_option                 = "Empty"
            disk_size_gb                  = 64
            lun                           = 0
            zone                          = "1"
            caching                       = "ReadWrite"
            network_access_policy         = "DenyAll"
            public_network_access_enabled = false
          },
          {
            name                          = "datadisk-0002"
            storage_account_type          = "StandardSSD_LRS"
            create_option                 = "Empty"
            disk_size_gb                  = 64
            lun                           = 1
            zone                          = "1"
            caching                       = "ReadWrite"
            network_access_policy         = "DenyAll"
            public_network_access_enabled = false
          },
          {
            name                          = "datadisk-0003"
            storage_account_type          = "StandardSSD_LRS"
            create_option                 = "Empty"
            disk_size_gb                  = 64
            lun                           = 2
            zone                          = "1"
            caching                       = "ReadWrite"
            network_access_policy         = "DenyAll"
            public_network_access_enabled = false
          }
        ]

        network_interface = {
          name = "nic-0001"
          ip_configuration = {
            subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
          }
        }

        vm_extension = {
          name                 = "ext-mountdisks-configure-druid"
          mount_point_name     = "mnt1"
          file_system          = "ext4"
          disk_partition       = "sdc"
          csfile               = "${path.module}/script/druid-server.tftpl"
          storage_account_name = module.storage-account["${local.common.app_name_adtech}storage1"].storage_account_name
          storage_account_key  = module.storage-account["${local.common.app_name_adtech}storage1"].primary_access_key
          storage_uri          = module.storage-account["${local.common.app_name_adtech}storage1"].primary_blob_endpoint
          fileUris             = "software-config-files/kafka_2.12-3.4.1.tgz,software-config-files/Python-3.6.0.tar.xz,software-config-files/spark-3.4.1-bin-hadoop3.tgz,software-config-files/apache-druid-26.0.0-bin.tar.gz"
        }
      }

      cardinality0001 = {
        name                 = "cardinality-0001"
        location             = local.common.location
        resource_group_name  = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_adtek}-0001"
        vm_size              = "Standard_D4ds_v5"
        environment          = "${local.common.dep_env}"
        zone                 = [1]
        boot_storage_account = module.storage-account["st${local.common.bu_name}${local.common.app_name_adtek}${local.common.dep_env}ci1boot002"].primary_blob_endpoint

        storage_os_disk = {
          name              = "osdisk"
          os_type           = "Linux"
          caching           = "ReadWrite"
          create_option     = "FromImage"
          managed_disk_type = "StandardSSD_LRS"
        }

        storage_image_reference = "/subscriptions/${local.sec_subscription_id}/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/Ubuntu2204Standard/versions/0.0.1"

        os_profile = {
          computer_name  = "computername"
          admin_username = "vmadmin"
          admin_password = var.vm_admin_password
        }

        os_profile_linux_config = {
          ssh_keys = {
            key_data = file("${path.module}/ssh/vm.pub")
            path     = "/home/vmadmin/.ssh/authorized_keys"
          }
        }

        managed_disk = [
          {
            name                          = "datadisk-0001"
            storage_account_type          = "StandardSSD_LRS"
            create_option                 = "Empty"
            disk_size_gb                  = 32
            lun                           = 0
            zone                          = "1"
            caching                       = "ReadWrite"
            network_access_policy         = "DenyAll"
            public_network_access_enabled = false
          },
          {
            name                          = "datadisk-0002"
            storage_account_type          = "StandardSSD_LRS"
            create_option                 = "Empty"
            disk_size_gb                  = 64
            lun                           = 1
            zone                          = "1"
            caching                       = "ReadWrite"
            network_access_policy         = "DenyAll"
            public_network_access_enabled = false
          }
        ]

        network_interface = {
          name = "nic-0001"
          ip_configuration = {
            subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
          }
        }

        vm_extension = {
          name                 = "ext-mountdisks-configure-cardinality"
          mount_point_name     = "mnt1"
          file_system          = "ext4"
          disk_partition       = "sdc"
          csfile               = "${path.module}/script/cardinality-server.tftpl"
          storage_account_name = module.storage-account["${local.common.app_name_adtech}storage1"].storage_account_name
          storage_account_key  = module.storage-account["${local.common.app_name_adtech}storage1"].primary_access_key
          storage_uri          = module.storage-account["${local.common.app_name_adtech}storage1"].primary_blob_endpoint
          fileUris             = "software-config-files/kafka_2.12-3.4.1.tgz,software-config-files/Python-3.6.0.tar.xz,software-config-files/spark-3.4.1-bin-hadoop3.tgz,software-config-files/apache-druid-26.0.0-bin.tar.gz"
        }
      }

      redis0001 = {
        name                 = "redis-0001"
        location             = local.common.location
        resource_group_name  = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_adtek}-0001"
        vm_size              = "Standard_D4ds_v5"
        environment          = "${local.common.dep_env}"
        zone                 = [1]
        boot_storage_account = module.storage-account["st${local.common.bu_name}${local.common.app_name_adtek}${local.common.dep_env}ci1boot002"].primary_blob_endpoint

        storage_os_disk = {
          name              = "osdisk"
          os_type           = "Linux"
          caching           = "ReadWrite"
          create_option     = "FromImage"
          managed_disk_type = "StandardSSD_LRS"
        }

        storage_image_reference = "/subscriptions/${local.sec_subscription_id}/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/Ubuntu2204Standard/versions/0.0.1"

        os_profile = {
          computer_name  = "computername"
          admin_username = "vmadmin"
          admin_password = var.vm_admin_password
        }

        os_profile_linux_config = {
          ssh_keys = {
            key_data = file("${path.module}/ssh/vm.pub")
            path     = "/home/vmadmin/.ssh/authorized_keys"
          }
        }

        managed_disk = [
          {
            name                          = "datadisk-0001"
            storage_account_type          = "StandardSSD_LRS"
            create_option                 = "Empty"
            disk_size_gb                  = 32
            lun                           = 0
            zone                          = "1"
            caching                       = "ReadWrite"
            network_access_policy         = "DenyAll"
            public_network_access_enabled = false
          },
          {
            name                          = "datadisk-0002"
            storage_account_type          = "StandardSSD_LRS"
            create_option                 = "Empty"
            disk_size_gb                  = 64
            lun                           = 1
            zone                          = "1"
            caching                       = "ReadWrite"
            network_access_policy         = "DenyAll"
            public_network_access_enabled = false
          }
        ]

        network_interface = {
          name = "nic-0001"
          ip_configuration = {
            subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
          }
        }

        vm_extension = {
          name                 = "ext-mountdisks-configure-redis"
          mount_point_name     = "mnt1"
          file_system          = "ext4"
          disk_partition       = "sdc"
          csfile               = "${path.module}/script/redis-server.tftpl"
          storage_account_name = module.storage-account["${local.common.app_name_adtech}storage1"].storage_account_name
          storage_account_key  = module.storage-account["${local.common.app_name_adtech}storage1"].primary_access_key
          storage_uri          = module.storage-account["${local.common.app_name_adtech}storage1"].primary_blob_endpoint
          fileUris             = "software-config-files/kafka_2.12-3.4.1.tgz,software-config-files/Python-3.6.0.tar.xz,software-config-files/spark-3.4.1-bin-hadoop3.tgz,software-config-files/apache-druid-26.0.0-bin.tar.gz"
        }
      }

      dboxnonrequest0001 = {
        name                 = "dbox-non-request-0001"
        location             = local.common.location
        resource_group_name  = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_adtek}-0001"
        vm_size              = "Standard_D2lds_v5"
        environment          = "${local.common.dep_env}"
        zone                 = [1]
        boot_storage_account = module.storage-account["st${local.common.bu_name}${local.common.app_name_adtek}${local.common.dep_env}ci1boot002"].primary_blob_endpoint

        storage_os_disk = {
          name              = "osdisk"
          os_type           = "Linux"
          caching           = "ReadWrite"
          create_option     = "FromImage"
          managed_disk_type = "StandardSSD_LRS"
        }

        storage_image_reference = "/subscriptions/${local.sec_subscription_id}/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/Ubuntu2204Standard/versions/0.0.1"

        os_profile = {
          computer_name  = "computername"
          admin_username = "vmadmin"
          admin_password = var.vm_admin_password
        }

        os_profile_linux_config = {
          ssh_keys = {
            key_data = file("${path.module}/ssh/vm.pub")
            path     = "/home/vmadmin/.ssh/authorized_keys"
          }
        }

        managed_disk = [
          {
            name                          = "datadisk-0001"
            storage_account_type          = "StandardSSD_LRS"
            create_option                 = "Empty"
            disk_size_gb                  = 32
            lun                           = 0
            zone                          = "1"
            caching                       = "ReadWrite"
            network_access_policy         = "DenyAll"
            public_network_access_enabled = false
          }
        ]

        network_interface = {
          name = "nic-0001"
          ip_configuration = {
            subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
          }
        }

        vm_extension = {
          name                 = "ext-mountdisk-dbox-nonrequest"
          mount_point_name     = "mnt1"
          file_system          = "ext4"
          disk_partition       = "sdc"
          csfile               = "${path.module}/script/dbox-non-request-server.tftpl"
          storage_account_name = module.storage-account["${local.common.app_name_adtech}storage1"].storage_account_name
          storage_account_key  = module.storage-account["${local.common.app_name_adtech}storage1"].primary_access_key
          storage_uri          = module.storage-account["${local.common.app_name_adtech}storage1"].primary_blob_endpoint
          fileUris             = "software-config-files/kafka_2.12-3.4.1.tgz,software-config-files/Python-3.6.0.tar.xz,software-config-files/spark-3.4.1-bin-hadoop3.tgz,software-config-files/apache-druid-26.0.0-bin.tar.gz"
        }
      }

      bloomfilter0001 = {
        name                 = "bloom-0001"
        location             = local.common.location
        resource_group_name  = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name_adtek}-0001"
        vm_size              = "Standard_D4ds_v5"
        environment          = "${local.common.dep_env}"
        zone                 = [1]
        boot_storage_account = module.storage-account["st${local.common.bu_name}${local.common.app_name_adtek}${local.common.dep_env}ci1boot002"].primary_blob_endpoint

        storage_os_disk = {
          name              = "osdisk"
          os_type           = "Linux"
          caching           = "ReadWrite"
          create_option     = "FromImage"
          managed_disk_type = "StandardSSD_LRS"
        }

        storage_image_reference = "/subscriptions/${local.sec_subscription_id}/resourceGroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/Redhat/versions/0.0.2"

        os_profile = {
          computer_name  = "computername"
          admin_username = "vmadmin"
          admin_password = var.vm_admin_password
        }

        os_profile_linux_config = {
          ssh_keys = {
            key_data = file("${path.module}/ssh/vm.pub")
            path     = "/home/vmadmin/.ssh/authorized_keys"
          }
        }

        managed_disk = [
          {
            name                          = "datadisk-0001"
            storage_account_type          = "StandardSSD_LRS"
            create_option                 = "Empty"
            disk_size_gb                  = 32
            lun                           = 0
            zone                          = "1"
            caching                       = "ReadWrite"
            network_access_policy         = "DenyAll"
            public_network_access_enabled = false
          },
          {
            name                          = "datadisk-0002"
            storage_account_type          = "StandardSSD_LRS"
            create_option                 = "Empty"
            disk_size_gb                  = 64
            lun                           = 1
            zone                          = "1"
            caching                       = "ReadWrite"
            network_access_policy         = "DenyAll"
            public_network_access_enabled = false
          }
        ]

        network_interface = {
          name = "nic-0001"
          ip_configuration = {
            subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
          }
        }

        vm_extension = {
          name                 = "ext-mountdisks-configure-bloomfilter"
          mount_point_name     = "mnt1"
          file_system          = "ext4"
          disk_partition       = "sdc"
          csfile               = "${path.module}/script/bloomfilter-server.tftpl"
          storage_account_name = module.storage-account["${local.common.app_name_adtech}storage1"].storage_account_name
          storage_account_key  = module.storage-account["${local.common.app_name_adtech}storage1"].primary_access_key
          storage_uri          = module.storage-account["${local.common.app_name_adtech}storage1"].primary_blob_endpoint
          fileUris             = "software-config-files/kafka_2.12-3.4.1.tgz,software-config-files/Python-3.6.0.tar.xz,software-config-files/spark-3.4.1-bin-hadoop3.tgz,software-config-files/apache-druid-26.0.0-bin.tar.gz"
        }
      }

    }
  }
}


