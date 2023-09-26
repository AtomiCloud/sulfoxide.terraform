module "cluster_opal" {

  source = "../../../modules/L0/digital_ocean_cluster"

  providers = {
    digitalocean = digitalocean.opal
  }

  cluster       = local.clusters.opal
  k8s_version   = local.k8s_version
  instance_type = local.instance_type
  landscape     = local.landscape
  max_nodes     = local.max_nodes
  min_nodes     = local.min_nodes
  region        = local.digital_ocean_region

}

#module "cluster_ruby" {
#
#  source = "../../../modules/L0/digital_ocean_cluster"
#
#  providers = {
#    digitalocean = digitalocean.ruby
#  }
#
#  cluster       = local.clusters.ruby
#  k8s_version   = local.k8s_version
#  instance_type = local.instance_type
#  landscape     = local.landscape
#  max_nodes     = local.max_nodes
#  min_nodes     = local.min_nodes
#  region        = local.digital_ocean_region
#
#}