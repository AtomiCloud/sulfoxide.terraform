provider "cloudflare" {

  alias = "main"

  api_token = module.terraform_generic_secrets.secrets["CLOUDFLARE_TOKEN"].value
}

# OPAL
provider "helm" {

  alias = "opal"

  kubernetes {
    host                   = local.opal_cluster.kube_config[0].host
    cluster_ca_certificate = base64decode(local.opal_cluster.kube_config[0].cluster_ca_certificate)
    token                  = local.opal_cluster.kube_config[0].token
  }
}


provider "kubernetes" {

  alias = "opal"

  host                   = local.opal_cluster.kube_config[0].host
  cluster_ca_certificate = base64decode(local.opal_cluster.kube_config[0].cluster_ca_certificate)
  token                  = local.opal_cluster.kube_config[0].token
}

# RUBY
#provider "helm" {
#
#  alias = "ruby"
#
#  kubernetes {
#    host                   = local.ruby_cluster.kube_config[0].host
#    cluster_ca_certificate = base64decode(local.ruby_cluster.kube_config[0].cluster_ca_certificate)
#    token                  = local.ruby_cluster.kube_config[0].token
#  }
#}
#
#
#provider "kubernetes" {
#
#  alias = "ruby"
#
#  host                   = local.ruby_cluster.kube_config[0].host
#  cluster_ca_certificate = base64decode(local.ruby_cluster.kube_config[0].cluster_ca_certificate)
#  token                  = local.ruby_cluster.kube_config[0].token
#}


