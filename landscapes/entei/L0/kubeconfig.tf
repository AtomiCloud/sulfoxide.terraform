module "kubeconfig_opal" {

  source = "../../../modules/L0/connector_secret"

  landscape    = local.landscape
  project_name = "kubernetes-access"
  secret_name  = "OPAL_KUBECONFIG"

  name   = module.cluster_opal.name
  config = module.cluster_opal.config
  server = module.cluster_opal.server

}

// For ArgoCD to use
module "kubeconfig_opal_helium" {

  // Admin clusters
  for_each = local.doppler_landscapes.a

  source = "../../../modules/L0/connector_secret"

  landscape = each.key

  project_name = "${local.platforms.sulfoxide.slug}-${local.platforms.sulfoxide.services.argocd.slug}"
  secret_name  = "${upper(local.landscape)}_OPAL_KUBECONFIG"

  name   = module.cluster_opal.name
  config = module.cluster_opal.config
  server = module.cluster_opal.server

}

module "kubeconfig_ruby" {

  source = "../../../modules/L0/connector_secret"

  landscape    = local.landscape
  project_name = "kubernetes-access"
  secret_name  = "RUBY_KUBECONFIG"

  name   = module.cluster_ruby.name
  config = module.cluster_ruby.config
  server = module.cluster_ruby.server

}

module "kubeconfig_ruby_helium" {

  // Admin clusters
  for_each = local.doppler_landscapes.a

  source = "../../../modules/L0/connector_secret"

  landscape = each.key

  project_name = "${local.platforms.sulfoxide.slug}-${local.platforms.sulfoxide.services.argocd.slug}"
  secret_name  = "${upper(local.landscape)}_RUBY_KUBECONFIG"

  name   = module.cluster_ruby.name
  config = module.cluster_ruby.config
  server = module.cluster_ruby.server

}
