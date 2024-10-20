resource "azurerm_network_interface" "this" {
  name                          = var.settings.network_interface.name
  location                      = var.settings.location
  resource_group_name           = var.settings.resource_group_name
  enable_accelerated_networking = var.settings.network_interface.enable_accelerated_networking
  enable_ip_forwarding          = var.settings.network_interface.enable_ip_forwarding

  ip_configuration {
    name                          = "${var.settings.name}-ipconfig"
    subnet_id                     = var.settings.network_interface.ip_configuration.subnet_id
    private_ip_address_allocation = var.settings.network_interface.ip_configuration.private_ip_address_allocation
    private_ip_address            = var.settings.network_interface.ip_configuration.private_ip_address_allocation == "Static" ? var.settings.ip_configuration.private_ip_address : ""
    primary                       = var.settings.network_interface.ip_configuration.primary
    public_ip_address_id          = var.settings.network_interface.ip_configuration.public_ip_address_id == null ? null : var.settings.network_interface.ip_configuration.public_ip_address_id
  }
}

resource "azurerm_virtual_machine" "this" {
  name                  = var.settings.name
  location              = var.settings.location
  resource_group_name   = var.settings.resource_group_name
  network_interface_ids = [azurerm_network_interface.this.id]
  vm_size               = var.settings.vm_size
  zones                 = var.settings.zones

  storage_os_disk {
    name              = var.settings.storage_os_disk.name
    os_type           = var.settings.storage_os_disk.os_type
    caching           = var.settings.storage_os_disk.caching
    create_option     = var.settings.storage_os_disk.create_option
    managed_disk_type = var.settings.storage_os_disk.managed_disk_type
  }

  # dynamic "plan" {
  #   for_each = var.settings.plan != null ? var.settings.plan : []
  #   content {
  #     name      = plan.value.name
  #     product   = plan.value.product
  #     publisher = plan.value.publisher
  #   }
  # }

  dynamic "plan" {
    for_each = var.settings.plan == null ? [] : [1]
    content {
      publisher = var.settings.plan.publisher
      name      = var.settings.plan.name
      product   = var.settings.plan.product
    }
  }


  dynamic "storage_data_disk" {
    for_each = var.settings.storage_data_disk != null ? var.settings.storage_data_disk : []
    content {
      name              = storage_data_disk.value.name
      caching           = storage_data_disk.value.caching
      create_option     = storage_data_disk.value.create_option
      disk_size_gb      = storage_data_disk.value.disk_size_gb
      lun               = storage_data_disk.value.lun
      managed_disk_type = storage_data_disk.value.managed_disk_type
    }
  }

  storage_image_reference {
    id = var.settings.storage_image_reference
  }

  os_profile {
    computer_name  = var.settings.os_profile.computer_name
    admin_username = var.settings.os_profile.admin_username
    admin_password = var.settings.os_profile.admin_password
    custom_data    = var.settings.os_profile.custom_data
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  identity {
    type = "SystemAssigned"
  }

  lifecycle {
    ignore_changes = [
      boot_diagnostics[0].storage_uri, boot_diagnostics[0].enabled, identity
    ]
  }
  tags = var.settings.tags
}

resource "azurerm_disk_access" "this" {
  count               = var.settings.managed_disk == null ? 0 : 1
  name                = "${var.settings.managed_disk.name}-access"
  location            = var.settings.location
  resource_group_name = var.settings.resource_group_name
}


resource "azurerm_managed_disk" "this" {
  count                 = var.settings.managed_disk == null ? 0 : 1
  name                  = var.settings.managed_disk.name
  location              = var.settings.location
  resource_group_name   = var.settings.resource_group_name
  storage_account_type  = var.settings.managed_disk.storage_account_type
  create_option         = var.settings.managed_disk.create_option
  disk_size_gb          = var.settings.managed_disk.disk_size_gb
  disk_access_id        = azurerm_disk_access.this[0].id
  network_access_policy = "AllowPrivate"
}

resource "azurerm_virtual_machine_data_disk_attachment" "this" {
  count              = var.settings.managed_disk == null ? 0 : 1
  managed_disk_id    = azurerm_managed_disk.this[0].id
  virtual_machine_id = azurerm_virtual_machine.this.id
  lun                = var.settings.managed_disk.lun
  caching            = var.settings.managed_disk.caching
}

resource "azurerm_virtual_machine_extension" "vmext_cs" {
  count                = var.settings.vm_extension == null ? 0 : 1
  name                 = format("%s-%s", azurerm_virtual_machine.this.name, var.settings.vm_extension.name)
  virtual_machine_id   = azurerm_virtual_machine.this.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.1"
  settings             = <<SETTINGS
  {
   "script": "${fileexists(var.settings.vm_extension.csfile) ? base64encode(templatefile(var.settings.vm_extension.csfile, { data_disk = var.settings.vm_extension.data_disk, log_disk = var.settings.vm_extension.log_disk, file_system = var.settings.vm_extension.file_system, mount_point_name = var.settings.vm_extension.mount_point_name, disk_partition = var.settings.vm_extension.disk_partition })) : ""}"
  }
  SETTINGS

}
