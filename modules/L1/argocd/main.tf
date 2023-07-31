resource "helm_release" "argo" {

  name = "deployment-platform"

  create_namespace = true
  namespace        = local.namespace
  atomic           = true
  wait             = true

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"

  version = "5.42.0"

  values = [
    yamlencode({
      global = {
        logging = {
          format = "json"
          level  = "debug"
        }
      }
      configs = {
        cm = {
          create = true

          kustomize.enabled = true
          jsonnet.enabled   = true
          helm.enabled      = true

          application.resourceTrackingMethod = "annotation"

          helm.valuesFileSchemes = "https"
          admin.enabled          = true

          ui.bannercontent         = "sample"
          cluster.inClusterEnabled = true

          exec.enabled = false

          resource.exclusions                                    = <<EOL
- apiGroups:
    - kyverno.io
  kinds:
    - AdmissionReport
    - BackgroundScanReport
    - ClusterAdmissionReport
    - ClusterBackgroundScanReport
  clusters:
    - '*'
EOL
          resource.customizations.health.argoproj.io_Application = <<EOL
hs = {}
hs.status = "Progressing"
hs.message = ""
if obj.status ~= nil then
  if obj.status.health ~= nil then
    hs.status = obj.status.health.status
    if obj.status.health.message ~= nil then
      hs.message = obj.status.health.message
    end
  end
end
return hs
EOL
        }

        params = {
          create                       = true
          otlp.address                 = ""
          server.insecure              = true
          server.dex.server.plaintext  = true
          server.dex.server.strict.tls = false
          dexserver.disable.tls        = true

          controller.log.format = "json"
          controller.log.level  = "debug"

          server.log.format = "json"
          server.log.level  = "debug"
          server.repo.server.strict.tls : "false"
          server.disable.auth   = "false"
          server.enable.gzip    = "false"
          reposerver.log.format = "json"
          reposerver.log.level  = "debug"

        }
      }
    })
  ]
}

