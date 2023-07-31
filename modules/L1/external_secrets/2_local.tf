locals {

  labels = merge({
    "atomi.cloud/landscape" = var.landscape
    "atomi.cloud/platform"  = var.platform
    "atomi.cloud/service"   = var.service
    "atomi.cloud/layer"     = "1"
  }, var.additional_labels)

  annotations = merge({
    "atomi.cloud/landscape" = var.landscape
    "atomi.cloud/platform"  = var.platform
    "atomi.cloud/service"   = var.service
    "atomi.cloud/layer"     = "1"
  }, var.additional_labels)

  tags = merge({
    "atomi.cloud/landscape" = var.landscape
    "atomi.cloud/platform"  = var.platform
    "atomi.cloud/service"   = var.service
    "atomi.cloud/layer"     = "1"
  }, var.additional_labels)

  namespace = "secrets-engine"

  aws_key_id_key     = "aws_key_id"
  aws_key_secret_key = "aws_key_secret"


  secret_name = "external-secret-operator-aws-credentials"

  lps      = "${var.landscape}-${var.platform}-${var.service}"
  lps-fqdn = "${var.landscape}.${var.platform}.${var.service}"

}