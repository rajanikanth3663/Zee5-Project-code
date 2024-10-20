resource "azurerm_lb" "this" {
  name                = var.settings.name
  location            = var.settings.location
  resource_group_name = var.settings.resource_group_name
  sku                 = var.settings.sku
  tags                = var.settings.tags
  frontend_ip_configuration {
    name               = var.settings.frontend_ip_configuration.name
    subnet_id          = var.settings.frontend_ip_configuration.subnet_id
    private_ip_address = var.settings.frontend_ip_configuration.private_ip_address
  }
}


resource "azurerm_lb_backend_address_pool" "this" {
  loadbalancer_id = azurerm_lb.this.id
  name            = var.settings.backend_address_pool.name
}

resource "azurerm_lb_probe" "this" {
  loadbalancer_id = azurerm_lb.this.id
  name            = var.settings.lb_probe.name
  port            = var.settings.lb_probe.port
  protocol        = var.settings.lb_probe.protocol
}

resource "azurerm_lb_rule" "this" {
  loadbalancer_id                = azurerm_lb.this.id
  name                           = var.settings.lb_rule.name
  protocol                       = var.settings.lb_rule.protocol
  frontend_port                  = var.settings.lb_rule.frontend_port
  backend_port                   = var.settings.lb_rule.backend_port
  frontend_ip_configuration_name = var.settings.lb_rule.frontend_ip_configuration_name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.this.id]
  probe_id                       = azurerm_lb_probe.this.id
}
