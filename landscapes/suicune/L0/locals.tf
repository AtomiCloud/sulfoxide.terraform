locals {
  # aws
  aws_region = "ap-southeast-1"

  # main cluster
  digital_ocean_region = "sgp1"

  landscape = "suicune"

  clusters = {
    opal = "opal"
  }

  instance_type = "s-2vcpu-4gb"
  k8s_version   = "1.27"
  min_nodes     = 1
  max_nodes     = 4
}