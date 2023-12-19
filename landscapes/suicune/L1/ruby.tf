
#################
# 01 Prev Stack #
#################
locals {
  ruby_cluster = {
    id          = data.terraform_remote_state.L0.outputs.ruby_cluster_id
    endpoint    = data.terraform_remote_state.L0.outputs.ruby_cluster_endpoint
    kube_config = data.terraform_remote_state.L0.outputs.ruby_cluster_config
  }
}


################
# 02 Providers #
################

provider "helm" {

  alias = "ruby"

  kubernetes {
    host                   = local.ruby_cluster.kube_config[0].host
    cluster_ca_certificate = base64decode(local.ruby_cluster.kube_config[0].cluster_ca_certificate)
    token                  = local.ruby_cluster.kube_config[0].token
  }
}

provider "kubernetes" {

  alias = "ruby"

  host                   = local.ruby_cluster.kube_config[0].host
  cluster_ca_certificate = base64decode(local.ruby_cluster.kube_config[0].cluster_ca_certificate)
  token                  = local.ruby_cluster.kube_config[0].token
}

#######################
# 03 External Secrets #
#######################

module "ruby_external_secrets" {
  source = "../../../modules/L1/external_secrets"

  providers = {
    helm       = helm.ruby
    kubernetes = kubernetes.ruby
  }

  landscape = local.landscape
  platform  = local.platforms.sulfoxide.slug
  service   = local.platforms.sulfoxide.services.secrets_engine.slug

  root_secret = data.doppler_secrets.sulfoxide_sos.map.SULFOXIDE_SOS
}

