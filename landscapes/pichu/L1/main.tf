module "external-secrets" {
  source = "../../../modules/L1/external_secrets"

  providers = {
    aws        = aws.main
    helm       = helm.main
    kubernetes = kubernetes.main
  }

  aws_region = local.aws_region
  landscape  = local.landscape
  platform   = "systems"
  service    = "external-secrets"

}