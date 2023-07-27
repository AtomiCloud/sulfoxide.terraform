resource "helm_release" "codefresh_connector" {

  name = "codefresh-managed-cluster"

  create_namespace = true
  namespace        = "deployment-platform"
  atomic           = true

  repository = "https://chartmuseum.codefresh.io/csdp-add-cluster"
  chart      = "csdp-add-cluster"

  values = [
    yamlencode({
      ingressUrl  = var.ingress
      csdpToken   = var.token
      contextName = "${var.landscape}-${var.cluster_name}"
      server      = var.cluster_endpoint
      labels      = join(",", [for key, value in local.labels : "${key}: ${value}"])
      annotations = join(",", [for key, value in local.annotations : "${key}: ${value}"])
    })
  ]
}

