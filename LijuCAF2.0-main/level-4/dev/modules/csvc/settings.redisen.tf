locals {
  configure_redisen_resources = {
    settings = {
      redisen1 = {
        azurerm_redis_enterprise_cluster = [{
          name                = "redisen-ott007-dev-ci1-csss-0001"
          location            = "centralindia"
          resource_group_name = "rg-ott007-dev-ci1-csss-0001"
          sku_name            = "Enterprise_E20-4"
        }]

        azurerm_redis_enterprise_database = {
          name                = "default"
          cluster_id          = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Cache/redisEnterprise/redisen-ott007-dev-ci1-csss-0001/"
          client_protocol     = "Encrypted"
          resource_group_name = "rg-ott007-dev-ci1-csss-0001"
          clustering_policy   = "EnterpriseCluster"
          eviction_policy     = "NoEviction"
          port                = 10000
          linked_database_id = [
            "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Cache/redisEnterprise/redisen-ott007-dev-ci1-csss-0001/databases/default"
          ]
          linked_database_group_nickname = "redisen-ott007-dev-ci1-csss-0001-dbgroup"

        }

        private_endpoint = {
          endpoint_name   = "pep-ott007-np-ci1-csssredisen-0001"
          subnet_id       = "/subscriptions/subs01-xxxxx-xxxx/resourceGroups/rg-ott007-dev-ci1-csss-0001/providers/Microsoft.Network/virtualNetworks/vnet-ott007-dev-ci1-csss-0001/subnets/snet-ott007-dev-ci1-app-0007"
          connection_name = "redisen-ott007-dev-ci1-csss-0001-pvt-connection"
        }

      }

    }
  }
}
