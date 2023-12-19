#
##################
## 01 Prev Stack #
##################
#
#locals {
#
#  opal_cluster = {
#    id          = data.terraform_remote_state.L0.outputs.opal_cluster_id
#    endpoint    = data.terraform_remote_state.L0.outputs.opal_cluster_endpoint
#    kube_config = data.terraform_remote_state.L0.outputs.opal_cluster_config
#  }
#}
#
#
#################
## 02 Providers #
#################
#
#provider "helm" {
#
#  alias = "opal"
#
#  kubernetes {
#    host                   = local.opal_cluster.kube_config[0].host
#    cluster_ca_certificate = base64decode(local.opal_cluster.kube_config[0].cluster_ca_certificate)
#    token                  = local.opal_cluster.kube_config[0].token
#  }
#}
#
#
#provider "kubernetes" {
#
#  alias = "opal"
#
#  host                   = local.opal_cluster.kube_config[0].host
#  cluster_ca_certificate = base64decode(local.opal_cluster.kube_config[0].cluster_ca_certificate)
#  token                  = local.opal_cluster.kube_config[0].token
#}
#
#
########################
## 03 External Secrets #
########################
#
#module "opal_external_secrets" {
#  source = "../../../modules/L1/external_secrets"
#
#  providers = {
#    helm       = helm.opal
#    kubernetes = kubernetes.opal
#  }
#
#  landscape = local.landscape
#  platform  = local.platforms.sulfoxide.slug
#  service   = local.platforms.sulfoxide.services.secrets_engine.slug
#
#  root_secret = data.doppler_secrets.sulfoxide_sos.map.SULFOXIDE_SOS
#}
#
