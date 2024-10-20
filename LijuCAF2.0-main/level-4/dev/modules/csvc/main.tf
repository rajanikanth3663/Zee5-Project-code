data "azurerm_client_config" "core" {}
locals {
  tenant_id = "56bd48cd-f312-49e8-b6c7-7b5b926c03d6"
}
resource "azurerm_marketplace_agreement" "mongo" {
  publisher = "articentgroupllc1635512619530"
  offer     = "mongodb-server-ubuntu-20-04"
  plan      = "hourly"
}

resource "azurerm_marketplace_agreement" "solr" {
  publisher = "nilespartnersinc1617691698386"
  offer     = "solr"
  plan      = "hourly"
}

resource "azurerm_marketplace_agreement" "solr2" {
  publisher = "canonical"
  offer     = "0001-com-ubuntu-pro-bionic"
  plan      = "pro-18_04-lts-gen2"
}

/*resource "azurerm_marketplace_agreement" "kafkavm" {
  publisher = "cloud-infrastructure-services"
  offer     = "kafka-ubuntu"
  plan      = "hourly"
}*/

module "apim" {
  source   = "../../../../modules/apim"
  settings = local.configure_apim.settings
}

module "postgres_flexible" {
  settings = local.configure_postgres_resources.settings
  source   = "../../../../modules/postgresql"
}


module "storage" {
  settings = local.configure_storage_resources.settings
  source   = "../../../../modules/storage-account"
}

module "storage2" {
  settings = local.configure_storage2_resources.settings
  source   = "../../../../modules/storage-account"
}

module "mysql_flexible" {
  source   = "../../../../modules/mysql-flexible"
  settings = local.configure_mysql_resources.settings
}

module "sql_managed_instance" {
  source   = "../../../../modules/sql-mi"
  settings = local.configure_sql_mi_resources.settings
}

module "rediscache" {
  source   = "../../../../modules/rediscache"
  settings = local.configure_rediscache_resources.settings
}

module "redisen" {
  for_each = local.configure_redisen_resources.settings
  source   = "../../../../modules/redis-en"
  settings = each.value
}

# module "rediscache" {
#   for_each = local.configure_rediscache_resources.redissettings
#   source   = "../../../../modules/rediscache"
#   settings = each.value
# }

module "mongovm" {
  source   = "../../../../modules/vm-linux"
  settings = local.configure_mongovm_resources.settings
  ssh_details = {
    username   = local.configure_mongovm_resources.settings.admin_username
    public_key = file("${path.module}/ssh/mongo.pub")
  }
  depends_on = [azurerm_marketplace_agreement.mongo]
}

module "kafkavm" {
  source   = "../../../../modules/vm-linux"
  settings = local.configure_kafkavm_resources.settings
  ssh_details = {
    username   = local.configure_kafkavm_resources.settings.admin_username
    public_key = file("${path.module}/ssh/kafka.pub")
  }
}

module "scyllavm" {
  source   = "../../../../modules/vm-linux"
  settings = local.configure_scyllavm_resources.settings
  ssh_details = {
    username   = local.configure_scyllavm_resources.settings.admin_username
    public_key = file("${path.module}/ssh/scylla.pub")
  }
}


module "scyllacluster" {
  for_each = local.configure_vm_linux_scyllaimage.settings
  source   = "../../../../modules/vm-linux-customimage"
  settings = each.value
}


module "managedisk" {
  for_each = local.configure_manageddisk_cssssolr.settings
  source   = "../../../../modules/managed-disk"
  settings = each.value
}

module "solrvmci" {
  for_each   = local.configure_vm_linux_cssssolr.settings
  source     = "../../../../modules/vm-linux-civ2"
  settings   = each.value
  depends_on = [azurerm_marketplace_agreement.solr2]
}

module "solrvms" {
  for_each = local.configure_solrvms_resources.settings
  source   = "../../../../modules/vm-linux-customimage"
  settings = each.value
}

module "solrvm-ss" {
  for_each = local.configure_vm_linuxss_customimage.settings
  source   = "../../../../modules/vmss-linux"
  settings = each.value
}


module "solrvm" {
  source   = "../../../../modules/vm-linux"
  settings = local.configure_solrvm_resources.settings
  ssh_details = {
    username   = local.configure_solrvm_resources.settings.admin_username
    public_key = file("${path.module}/ssh/solr.pub")
  }
}

module "key_vault" {
  source   = "../../../../modules/key-vault"
  settings = local.configure_keyvault_resources.settings
}

module "aks" {
  source   = "../../../../modules/aks"
  settings = local.configure_aks_resources.settings
}

module "aks2" {
  source   = "../../../../modules/aks"
  settings = local.configure_aks_resources.aks2
}

module "eventhub" {
  source   = "../../../../modules/event-hub"
  settings = local.configure_eventhub.settings
}

module "eventhubs" {
  for_each = local.configure_eventhubs.settings
  source   = "../../../../modules/event-hub"
  settings = each.value
}

module "vm_linux_customimage" {
  for_each = local.configure_vm_linux_customimage.settings
  source   = "../../../../modules/vm-linux-customimage"
  settings = each.value
}

module "acs" {
  for_each = local.configure_acs_resources.settings
  source   = "../../../../modules/acs"
  settings = each.value
}

resource "azurerm_lb" "this" {
  name                = "lb-ott007-dev-ci1-cssssolr-0001"
  location            = "centralindia"
  resource_group_name = "rg-ott007-dev-ci1-csss-0002"
  sku                 = "Standard"

  lifecycle {
    ignore_changes = [frontend_ip_configuration]
  }

}
