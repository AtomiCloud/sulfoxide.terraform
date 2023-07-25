module "main_cluster" {
  source = "../../../modules/L0/cluster"

  providers = {
    vultr = vultr.main
  }

  k8s_version   = local.k8s_version
  instance_type = local.instance_type
  landscape     = local.landscape
  max_nodes     = local.max_nodes
  min_nodes     = local.min_nodes
  region        = local.region

}