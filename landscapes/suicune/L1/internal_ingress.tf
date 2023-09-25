locals {
  prefix = "${title(local.landscape)} ${title(local.clusters.opal_ruby)}"
}

module "opal_ruby_ingress" {
  source = "../../../modules/L1/cloudflare_zerotrust_tunnel"

  providers = {
    cloudflare = cloudflare.main
  }

  cloudflare_account_id              = local.cf_account_id
  cloudflare_zone                    = local.cf_zone
  cloudflare_gateway_posture_rule_id = local.cf_gateway_policy_id

  landscape = local.landscape
  cluster   = local.clusters.opal_ruby

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
      email_domains = ["atomi.cloud"]
      saml_groups   = ["engineer", "verified"]
      countries     = ["SG", "MY", "US"]

      bypass_everyone = false
      bypass_ips      = []

    }
  ]
}

resource "doppler_secret" "opal_ruby_ingress" {
  config  = local.landscape
  name    = "OPAL_RUBY_INGRESS_TOKEN"
  project = "${local.platforms.sulfoxide.slug}-${local.platforms.sulfoxide.services.argocd.slug}"
  value   = module.opal_ruby_ingress.tunnel_token
}