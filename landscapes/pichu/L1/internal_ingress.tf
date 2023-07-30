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
      name                 = "${local.prefix} Policies"
      dns                  = "policies-${local.clusters.opal}-${local.landscape}"
      session              = "24h"
      app_launcher_visible = true
      logo_url             = "https://raw.githubusercontent.com/cncf/artwork/master/projects/kyverno/icon/color/kyverno-icon-color.svg"
      idp                  = ["saml"]

      path    = "/*"
      service = "http://pichu-opal-kyverno-ui.policy-engine.svc.cluster.local:8080"

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