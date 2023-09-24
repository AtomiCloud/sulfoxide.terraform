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

module "opal_ruby_ingress_token" {
  source = "../../../modules/L0/write_infisical"

  infisical_host       = local.infisical_url
  infisical_root_token = var.infisical_token
  landscape            = local.landscape
  name                 = "OPAL_RUBY_CLOUDFLARE_INGRESS_TOKEN"
  project_name         = "${upper(local.platforms.sulfoxide.slug)}_${upper(local.platforms.sulfoxide.services.argocd.slug)}"
  root_path            = "/auto"
  secret               = module.opal_ruby_ingress.tunnel_token

  delete = false
}