locals {
  configure_manageddisk_csvcsolr = {

    settings = {
      solr-md1 = {
        azurerm_managed_disk = [{
          name                 = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}solr-0002-datadisk-0003"
          location             = local.common.location
          resource_group_name  = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0002"
          caching              = "ReadWrite"
          create_option        = "Empty"
          storage_account_type = "Standard_LRS"
          disk_size_gb         = "150"
          }, {
          name                 = "vm-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}solr-0002-datadisk-0004"
          location             = local.common.location
          resource_group_name  = "rg-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0002"
          caching              = "ReadWrite"
          create_option        = "Empty"
          storage_account_type = "Standard_LRS"
          disk_size_gb         = "150"
        }]
      }
    }
  }
}
