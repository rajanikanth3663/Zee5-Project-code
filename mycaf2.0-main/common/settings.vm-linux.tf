# locals {
#   configure_vm_linux_resources = {
#     settings = {
#       vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0001 = {
#         name                = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-csvcsolr-0001"
#         location            = local.common.location
#         resource_group_name = local.common.resource_group_name_csvc
#         admin_username      = "adminuser"
#         size                = "Standard_D4s_v5"
#         computer_name       = "${local.common.bu_name}csvcsolr${local.common.dep_env}"
#         os_disk = {
#           caching              = "ReadWrite"
#           storage_account_type = "Standard_LRS"
#         }

#         source_image_reference = {
#           publisher = "nilespartnersinc1617691698386"
#           offer     = "solr"
#           sku       = "solr"
#           version   = "latest"
#         }
#         plan = [{
#           name      = "solr"
#           product   = "solr"
#           publisher = "nilespartnersinc1617691698386"
#         }]

#         network_interface = {
#           name = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-solr-0001-nic-0001"
#           ip_configuration = {
#             subnet_id = "/subscriptions/subs-******-******/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-data-0008"
#           }
#         }
#         tags = {
#           "service-name"       = ""
#           "BusinessUnit"       = ""
#           "CostCenter"         = ""
#           "DisasterRecovery"   = ""
#           "environment"        = ""
#           "OwnerName"          = ""
#           "servicecriticality" = ""
#           "ISV"                = ""
#           "DataClassification" = ""
#           "service-family"     = ""
#           "ticket-id"          = ""
#           "lead-spoc"          = ""
#           "created_by"         = ""
#           "Created_Date"       = ""
#           "Updated_Date"       = ""
#         }
#       }
#     }
#   }
# }
