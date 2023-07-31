resource "helm_release" "argo_projects" {

  depends_on = [helm_release.argo]

  name             = "projects"
  namespace        = local.namespace
  atomic           = true
  wait             = true
  create_namespace = false

  chart = "${path.module}/chart"

  values = [
    yamlencode({
      serviceTree = {
        landscape = "mew"
        cluster   = "opal"
        platform  = "systems"
        service   = "deployment-platform"
        layer     = "1"
      }

      projects = {
        bootstrap = {
          desc = "Bootstrap Project used to setup the cluster"
        }
      }
    })
  ]
}
