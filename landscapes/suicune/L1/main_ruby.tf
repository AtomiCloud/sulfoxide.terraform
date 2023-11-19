module "ruby_external_secrets" {
  source = "../../../modules/L1/external_secrets"

  providers = {
    helm       = helm.ruby
    kubernetes = kubernetes.ruby
  }

  landscape = local.landscape
  platform  = local.platforms.sulfoxide.slug
  service   = local.platforms.sulfoxide.services.secrets_engine.slug

  root_secret = data.doppler_secrets.sulfoxide_sos.map.SULFOXIDE_SOS
}