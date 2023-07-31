locals {
  prefix = "${title(local.landscape)} ${title(local.clusters.opal)}"
}
module "pichu_opal_ingress" {
  source = "../../../modules/L1/cloudflare_zerotrust_tunnel"

  providers = {
    cloudflare = cloudflare.main
  }

  cloudflare_account_id = local.cf_account_id
  cloudflare_zone       = local.cf_zone

  landscape = local.landscape
  cluster   = local.clusters.opal

  tunnel_ingress_rules = [
    {
      name                 = "ArgoCD"
      dns                  = "deploy"
      session              = "24h"
      app_launcher_visible = true
      logo_url             = "https://icon.icepanel.io/Technology/svg/Argo-CD.svg"
      idp                  = ["saml"]

      path    = "/*"
      service = "http://argocd-server.deployment-platform.svc.cluster.local:443"

      warp          = true
      email_domains = ["eng.atomi.cloud", "atomi.cloud"]
      saml_groups   = ["engineer"]
      countries     = ["SG", "MY", "US"]

      bypass_everyone = false
      bypass_ips      = []

    }
  ]
}

resource "aws_ssm_parameter" "pichu_opal_ingress_token" {

  provider = aws.main

  name        = "/${local.landscape}/${local.clusters.opal}/cloudflare/token"
  description = "Cloudflare API Token for ${local.landscape} ${local.clusters.opal}'s tunnel"
  type        = "SecureString"
  value       = module.pichu_opal_ingress.tunnel_token
}