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
    (local.aws_key_id_key)     = aws_iam_access_key.this.id
    (local.aws_key_secret_key) = aws_iam_access_key.this.secret
  }

}