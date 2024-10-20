resource "azurerm_linux_virtual_machine_scale_set" "this" {
  name                            = var.settings.name
  location                        = var.settings.location
  resource_group_name             = var.settings.resource_group_name
  admin_username                  = var.settings.admin_username
  admin_password                  = var.settings.admin_password
  disable_password_authentication = false
  sku                             = var.settings.sku
  instances                       = var.settings.instances

  dynamic "source_image_reference" {

    for_each = var.settings.source_image_reference != null ? { enabled = true } : {}
    content {
      publisher = var.settings.source_image_reference.publisher
      offer     = var.settings.source_image_reference.offer
      sku       = var.settings.source_image_reference.sku
      version   = var.settings.source_image_reference.version
    }
  }

  source_image_id = var.settings.source_image_id

  os_disk {
    storage_account_type = var.settings.os_disk.storage_account_type
    caching              = var.settings.os_disk.caching
  }

  dynamic "data_disk" {
    for_each = var.settings.storage_data_disk != null ? var.settings.storage_data_disk : []
    content {
      # name                 = data_disk.value.name
      caching              = data_disk.value.caching
      create_option        = data_disk.value.create_option
      disk_size_gb         = data_disk.value.disk_size_gb
      lun                  = data_disk.value.lun
      storage_account_type = data_disk.value.managed_disk_type
    }
  }


  dynamic "plan" {
    for_each = var.settings.plan == null ? [] : [1]
    content {
      publisher = var.settings.plan.publisher
      name      = var.settings.plan.name
      product   = var.settings.plan.product
    }
  }

  dynamic "scale_in" {
    for_each = var.settings.scale_in == null ? [] : [1]
    content {
      rule                   = var.settings.scale_in.rule
      force_deletion_enabled = var.settings.scale_in.force_deletion_enabled
    }
  }

  identity {
    type = "SystemAssigned"
  }

  network_interface {
    name    = var.settings.network_interface.name
    primary = true

    ip_configuration {
      name                                   = "${var.settings.name}-ipconfig"
      primary                                = var.settings.network_interface.ip_configuration.primary
      subnet_id                              = var.settings.network_interface.ip_configuration.subnet_id
      load_balancer_backend_address_pool_ids = var.settings.network_interface.ip_configuration.load_balancer_backend_address_pool_ids
    }
  }

  lifecycle {
    ignore_changes = [instances]
  }

  tags = var.settings.tags
}

resource "azurerm_monitor_autoscale_setting" "this" {
  name                = "${var.settings.name}-autoscale-settings"
  resource_group_name = var.settings.resource_group_name
  location            = var.settings.location
  target_resource_id  = azurerm_linux_virtual_machine_scale_set.this.id

  profile {
    name = "defaultProfile"

    capacity {
      default = 1
      minimum = 1
      maximum = 3
    }

    dynamic "rule" {
      for_each = (var.settings.autoscale_setting.profile.rule == null) ? [] : var.settings.autoscale_setting.profile.rule
      content {
        metric_trigger {
          metric_name        = rule.value.metric_trigger.metric_name
          metric_resource_id = azurerm_linux_virtual_machine_scale_set.this.id
          time_grain         = rule.value.metric_trigger.time_grain
          statistic          = rule.value.metric_trigger.statistic
          time_window        = rule.value.metric_trigger.time_window
          time_aggregation   = rule.value.metric_trigger.time_aggregation
          operator           = rule.value.metric_trigger.operator
          threshold          = rule.value.metric_trigger.threshold
          metric_namespace   = "microsoft.compute/virtualmachinescalesets"
        }

        scale_action {
          direction = rule.value.scale_action.direction
          type      = rule.value.scale_action.type
          value     = rule.value.scale_action.value
          cooldown  = rule.value.scale_action.cooldown
        }
      }
    }
  }

  predictive {
    scale_mode      = var.settings.autoscale_setting.profile.predictive.scale_mode
    look_ahead_time = var.settings.autoscale_setting.profile.predictive.look_ahead_time
  }
}


resource "azurerm_virtual_machine_scale_set_extension" "vmext_cs" {
  count                        = var.settings.vm_extension == null ? 0 : 1
  name                         = format("%s-%s", azurerm_linux_virtual_machine_scale_set.this.name, var.settings.vm_extension.name)
  virtual_machine_scale_set_id = azurerm_linux_virtual_machine_scale_set.this.id
  publisher                    = "Microsoft.Azure.Extensions"
  type                         = "CustomScript"
  type_handler_version         = "2.1"
  settings                     = <<SETTINGS
  {
   "script": "${fileexists(var.settings.vm_extension.csfile) ? base64encode(templatefile(var.settings.vm_extension.csfile, { data_disk = var.settings.vm_extension.data_disk, log_disk = var.settings.vm_extension.log_disk, file_system = var.settings.vm_extension.file_system, mount_point_name = var.settings.vm_extension.mount_point_name, disk_partition = var.settings.vm_extension.disk_partition })) : ""}"
  }
  SETTINGS

}
