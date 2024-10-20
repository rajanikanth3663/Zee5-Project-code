locals {
  configure_manageddisk_cssssolr = {

    settings = {
      solr-md1 = {
        azurerm_managed_disk = [{
          name                 = "vm-ott007-dev-ci1-cssssolr-0002-datadisk-0003"
          location             = "centralindia"
          resource_group_name  = "rg-ott007-dev-ci1-csss-0002"
          caching              = "ReadWrite"
          create_option        = "Empty"
          storage_account_type = "Standard_LRS"
          disk_size_gb         = "150"
          }, {
          name                 = "vm-ott007-dev-ci1-cssssolr-0002-datadisk-0004"
          location             = "centralindia"
          resource_group_name  = "rg-ott007-dev-ci1-csss-0002"
          caching              = "ReadWrite"
          create_option        = "Empty"
          storage_account_type = "Standard_LRS"
          disk_size_gb         = "150"
        }]
      }
    }
  }
}
