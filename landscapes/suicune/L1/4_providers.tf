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

provider "cloudflare" {

  alias = "main"

  api_token = data.aws_ssm_parameter.cloudflare_token.value
}