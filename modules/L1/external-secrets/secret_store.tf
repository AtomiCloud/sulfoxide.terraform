resource "helm_release" "secret_store" {

  depends_on = [
    helm_release.external_secret_operator,
    kubernetes_secret_v1.external_secret_operator,
    kubernetes_namespace_v1.secret_engine,
  ]

  name             = "secret-store"
  namespace        = local.namespace
  atomic           = true
  wait             = true
  create_namespace = false

  chart = "${path.module}/chart"

  values = [
    yamlencode({
      name = "aws-ssm-secret-store"
      labels = merge(local.labels, {
        "atomi.cloud/module" = "secret-store"
        "atomi.cloud/bump"   = "1"
      })
      annotations = merge(local.annotations, {
        "atomi.cloud/module" = "secret-store"
      })
      region     = var.aws_region
      secretName = local.secret_name
      idKey      = local.aws_key_id_key
      secretKey  = local.aws_key_secret_key
    })
  ]
}
