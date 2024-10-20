# locals {
#   configure_kafkavm_resources = {
#     settings = {
#       name                = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvckafka-0001"
#       location            = "centralindia"
#       resource_group_name = local.common.resource_group_name_csvc
#       admin_username      = "adminuser"
#       size                = "Standard_D2s_v5"
#       computer_name       = "${local.common.bu_name}csvckafka${local.common.dep_env}"
#       os_disk = {
#         caching              = "ReadWrite"
#         storage_account_type = "Standard_LRS"
#       }

#       source_image_reference = {
#         publisher = "cloud-infrastructure-services"
#         offer     = "kafka-ubuntu"
#         sku       = "kafka-ubuntu-20-04"
#         version   = "latest"
#       }
#       plan = [{
#         name      = "kafka-ubuntu-20-04"
#         product   = "kafka-ubuntu"
#         publisher = "cloud-infrastructure-services"
#       }]
#       network_interface = {
#         name = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-kafka-0001-nic-0001"
#         ip_configuration = {
#           subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/rg-${local.common.bu_name}-${local.common.dep_env}-ci1-csvc-0001/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-csvc-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"
#         }
#       }
#       tags = {
#         "service-name"       = ""
#         "BusinessUnit"       = ""
#         "CostCenter"         = ""
#         "DisasterRecovery"   = ""
#         "environment"        = ""
#         "OwnerName"          = ""
#         "servicecriticality" = ""
#         "ISV"                = ""
#         "DataClassification" = ""
#         "service-family"     = ""
#         "ticket-id"          = ""
#         "lead-spoc"          = ""
#         "created_by"         = ""
#         "Created_Date"       = ""
#         "Updated_Date"       = ""
#       }
#     }
#   }
# }

