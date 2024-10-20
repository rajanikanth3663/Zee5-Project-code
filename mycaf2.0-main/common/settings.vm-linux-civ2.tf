# locals {
#   configure_vm_linux_csvcsolr = {
#     settings = {
#       xx77-solrvmcs-Server = {
#         name                = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0002"
#         location            = local.common.location
#         resource_group_name = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0002"
#         vm_size             = "Standard_D2lds_v5"

#         storage_os_disk = {
#           name              = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0002-osdisk-0001"
#           os_type           = "Linux"
#           caching           = "ReadWrite"
#           create_option     = "FromImage"
#           managed_disk_type = "Standard_LRS"
#         }

#         storage_data_disk = [{
#           name            = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0002-datadisk-0003"
#           caching         = "ReadWrite"
#           lun             = 2
#           managed_disk_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0002/providers/Microsoft.Compute/disks/vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0002-datadisk-0003"
#           },
#           {
#             name            = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0002-datadisk-0004"
#             caching         = "ReadWrite"
#             lun             = 3
#             managed_disk_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0002/providers/Microsoft.Compute/disks/vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0002-datadisk-0004"
#         }]

#         storage_image_reference = "/subscriptions/${local.sec_subscription_id}/resourcegroups/rg-its-np-ci1-jmp-0001/providers/Microsoft.Compute/galleries/galitsnpci10001/images/SolrUbuntu1804HardenedImage"

#         os_profile = {
#           computer_name  = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0002"
#           admin_username = "testadmin"
#           admin_password = "Azure@123456"
#           # custom_data    = filebase64("${path.module}/script/admin.solr.in.sh")
#           custom_data = filebase64("${path.module}/script/solr1.sh")
#         }

#         network_interface = {
#           name = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0002-nic-0001"
#           ip_configuration = {
#             subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"
#           }
#         }
#       }
#     }
#   }
# }