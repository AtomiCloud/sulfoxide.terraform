resource "kubernetes_secret_v1" "root_secret" {

  metadata {
    name = local.secret_name

    labels = merge(local.labels, {
      "atomi.cloud/module" = "credentials"
    })
    annotations = merge(local.annotations, {
      "atomi.cloud/module" = "credentials"
    })
    namespace = local.namespace
  }

  data = {
    infisicalToken = var.root_secret
  }

}