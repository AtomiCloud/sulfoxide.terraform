resource "kubernetes_secret_v1" "external_secret_operator" {
  depends_on = [helm_release.argo]
  metadata {
    name = "repository-credentials"
    labels = {
      argocd.argoproj.io / secret-type = "repo-creds"
    }
    namespace = local.namespace
  }

  data = {
    (url)      = var.url
    (type)     = "helm"
    (password) = var.password
    (username) = var.username
  }
}