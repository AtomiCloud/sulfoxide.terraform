provider "helm" {

  alias = "main"

  kubernetes {
    host                   = yamldecode(base64decode(local.main_cluster.kube_config)).clusters[0].cluster.server
    client_certificate     = base64decode(yamldecode(base64decode(local.main_cluster.kube_config)).users[0].user.client-certificate-data)
    client_key             = base64decode(yamldecode(base64decode(local.main_cluster.kube_config)).users[0].user.client-key-data)
    cluster_ca_certificate = base64decode(yamldecode(base64decode(local.main_cluster.kube_config)).clusters[0].cluster.certificate-authority-data)
  }
}


provider "kubernetes" {

  alias = "main"

  host                   = yamldecode(base64decode(local.main_cluster.kube_config)).clusters[0].cluster.server
  client_certificate     = base64decode(yamldecode(base64decode(local.main_cluster.kube_config)).users[0].user.client-certificate-data)
  client_key             = base64decode(yamldecode(base64decode(local.main_cluster.kube_config)).users[0].user.client-key-data)
  cluster_ca_certificate = base64decode(yamldecode(base64decode(local.main_cluster.kube_config)).clusters[0].cluster.certificate-authority-data)
}