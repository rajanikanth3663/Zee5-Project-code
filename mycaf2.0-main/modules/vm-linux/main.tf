resource "azurerm_linux_virtual_machine" "this" {
  name                = var.settings.name
  resource_group_name = var.settings.resource_group_name
  location            = var.settings.location
  size                = var.settings.size
  admin_username      = var.settings.admin_username
  admin_ssh_key {
    username   = var.ssh_details.username
    public_key = var.ssh_details.public_key
  }
  availability_set_id   = var.settings.availability_set_id == null ? null : var.settings.availability_set_id
  network_interface_ids = [azurerm_network_interface.this.id]
  license_type          = var.settings.license_type
  computer_name         = var.settings.computer_name == null ? var.settings.name : var.settings.computer_name
  tags                  = var.settings.tags
  depends_on            = [azurerm_network_interface.this]

  os_disk {
    name                      = format("%s-%s", var.settings.name, "osdisk")
    caching                   = var.settings.os_disk.caching
    storage_account_type      = var.settings.os_disk.storage_account_type
    disk_size_gb              = var.settings.os_disk.disk_size_gb
    write_accelerator_enabled = var.settings.os_disk.write_accelerator_enabled
  }

  source_image_reference {
    publisher = var.settings.source_image_reference.publisher
    offer     = var.settings.source_image_reference.offer
    sku       = var.settings.source_image_reference.sku
    version   = var.settings.source_image_reference.version
  }
  dynamic "plan" {
    for_each = var.settings.plan != null ? var.settings.plan : []
    content {
      name      = plan.value.name
      product   = plan.value.product
      publisher = plan.value.publisher
    }
  }

  identity {
    type = "SystemAssigned"
  }
}

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
