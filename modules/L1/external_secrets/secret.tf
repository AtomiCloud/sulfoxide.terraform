resource "kubernetes_secret_v1" "external_secret_operator" {
  depends_on = [kubernetes_namespace_v1.secret_engine]
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
    (local.secret_key) = var.root_secret
  }
}