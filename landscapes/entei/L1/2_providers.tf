provider "cloudflare" {

  alias = "main"

  api_token = data.doppler_secrets.arceus_sulfoxide_terraform.map.MANUAL_CLOUDFLARE_TOKEN
}

provider "neon" {

  alias   = "main"
  api_key = data.doppler_secrets.arceus_sulfoxide_terraform.map.MANUAL_NEON_TOKEN

}



# OPAL
provider "digitalocean" {
  alias = "opal"
  token = data.doppler_secrets.entei_sulfoxide_terraform.map.OPAL_DIGITALOCEAN_TOKEN
}

provider "digitalocean" {
  alias = "ruby"
  token = data.doppler_secrets.entei_sulfoxide_terraform.map.RUBY_DIGITALOCEAN_TOKEN
}

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
