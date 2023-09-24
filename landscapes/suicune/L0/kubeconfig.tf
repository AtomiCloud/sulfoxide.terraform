module "kubeconfig_opal" {

  source = "../../../modules/L0/connector_secret"

  infisical_host       = local.infisical_url
  infisical_root_token = var.infisical_token

  landscape    = local.landscape
  path_secret  = "/"
  project_name = "KUBERNETES_ACCESS"
  secret_name  = "OPAL_KUBECONFIG"

  name   = module.cluster_opal.name
  config = module.cluster_opal.config
  server = module.cluster_opal.server

}

# verna.lebsack48@buc.blinn.edu
# verna.lebsack48@buc.blinn.edu

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