data "azurerm_client_config" "current" {}

module "vm_linux" {
  source   = "../../../modules/vm-linux"
  settings = local.configure_vm_linux_resources.settings
  ssh_details = {
    username   = local.configure_vm_linux_resources.settings.admin_username
    public_key = file("${path.module}/ssh/id_rsa.pub")
  }
}

