locals {
  # main cluster
  digital_ocean_region = "sgp1"

  landscape = local.landscapes.suicune.slug

  clusters = {
    opal = "opal"
    ruby = "ruby"
  }

  instance_type = "s-2vcpu-4gb"
  k8s_version   = "1.27"
  min_nodes     = 1
  max_nodes     = 4
}