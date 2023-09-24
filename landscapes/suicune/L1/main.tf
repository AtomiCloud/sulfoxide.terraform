module "opal_external_secrets" {
  source = "../../../modules/L1/external_secrets"

  providers = {
    helm       = helm.opal
    kubernetes = kubernetes.opal
  }

  landscape = local.landscape
  platform  = local.platforms.sulfoxide.slug
  service   = "secrets-operator"

  root_secret = var.infisical_token
}


#module "ruby_external_secrets" {
#  source = "../../../modules/L1/external_secrets"
#
#  providers = {
#    helm       = helm.ruby
#    kubernetes = kubernetes.ruby
#  }
#
#  landscape = local.landscape
#  platform  = local.platforms.sulfoxide.slug
#  service   = "secrets-operator"
#
#  root_secret = var.infisical_token
#}

