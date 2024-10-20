locals {
  configure_lb_resources = {
    settings = {
      "lb-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}solr-0001" = {
        resource_group_name = "${local.common.resource_group_name_csvc02}"
        name                = "lb-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}solr-0001"
        location            = local.common.location

        frontend_ip_configuration = {
          name      = "solr${local.common.dep_env}frontendip"
          subnet_id = "/subscriptions/${local.subscription_id}/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.Network/virtualNetworks/vnet-${local.common.bu_name}-${local.common.dep_env}-ci1-${local.common.app_name}-0001/subnets/snet-${local.common.bu_name}-${local.common.dep_env}-ci1-app-0007"
          zones     = ["1", "2", "3"]
        }

        backend_address_pool = {
          name = "solr${local.common.dep_env}_backendpool"
        }

        lb_probe = {
          name     = "port_8983"
          port     = 8983
          protocol = "Tcp"
        }

        lb_rule = {
          name                           = "${local.common.app_name}-solr-replicarule"
          protocol                       = "Tcp"
          frontend_port                  = 8983
          backend_port                   = 8983
          frontend_ip_configuration_name = "solr${local.common.dep_env}frontendip"
        }
      }
    }
  }
}
