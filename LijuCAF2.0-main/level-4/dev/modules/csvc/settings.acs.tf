locals {
  configure_acs_resources = {
    settings = {
      acs-ott007-dev-ci1-csss-0001 = {
        resource_group_name = "rg-ott007-dev-ci1-csss-0001"
        name                = "acs-ott007-dev-ci1-csss-0001"
        data_location       = "India"
      }
    }
  }
}
