locals {
  securityContext = {
    allowPrivilegeEscalation = false
    capabilities = {
      drop = ["ALL"]
    }
    privileged             = false
    readOnlyRootFilesystem = true
    runAsNonRoot           = true
  }

}

resource "helm_release" "external_secret_operator" {

  depends_on = [kubernetes_namespace_v1.secret_engine]

  name = "external-secrets-operator"

  create_namespace = false
  namespace        = local.namespace

  version = "0.2.1"

  atomic = true
  wait   = true

  repository = "https://dl.cloudsmith.io/public/infisical/helm-charts/helm/charts/"
  chart      = "secrets-operator"

  values = [
    yamlencode({})
  ]
}

