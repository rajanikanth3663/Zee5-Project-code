resource "azurerm_network_interface" "this" {
  name                          = var.settings.network_interface.name
  location                      = var.settings.location
  resource_group_name           = var.settings.resource_group_name
  enable_accelerated_networking = var.settings.network_interface.enable_accelerated_networking
  enable_ip_forwarding          = false

  ip_configuration {
    name                          = "${var.settings.name}-ipconfig"
    subnet_id                     = var.settings.network_interface.ip_configuration.subnet_id
    private_ip_address_allocation = var.settings.network_interface.ip_configuration.private_ip_address_allocation
    private_ip_address            = var.settings.network_interface.ip_configuration.private_ip_address_allocation == "Static" ? var.settings.ip_configuration.private_ip_address : ""
    primary                       = var.settings.network_interface.ip_configuration.primary
  }
}

resource "azurerm_virtual_machine" "this" {
  name                  = var.settings.name
  location              = var.settings.location
  resource_group_name   = var.settings.resource_group_name
  network_interface_ids = [azurerm_network_interface.this.id]
  vm_size               = var.settings.vm_size

  storage_os_disk {
    name              = var.settings.storage_os_disk.name
    os_type           = var.settings.storage_os_disk.os_type
    caching           = var.settings.storage_os_disk.caching
    create_option     = var.settings.storage_os_disk.create_option
    managed_disk_type = var.settings.storage_os_disk.managed_disk_type
  }

  storage_image_reference {
    id = var.settings.storage_image_reference
  }

  os_profile {
    computer_name  = var.settings.os_profile.computer_name
    admin_username = var.settings.os_profile.admin_username
    admin_password = var.settings.os_profile.admin_password
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

  os_profile_windows_config {
    provision_vm_agent        = var.settings.os_profile_windows_config.provision_vm_agent
    enable_automatic_upgrades = var.settings.os_profile_windows_config.enable_automatic_upgrades
  }

  identity {
    type = "SystemAssigned"
  }

  lifecycle {
    ignore_changes = [
      boot_diagnostics[0].storage_uri, boot_diagnostics[0].enabled
    ]
  }
  tags = var.settings.tags
}

