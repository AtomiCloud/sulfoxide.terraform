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

  secret_name = "external-secret-operator-doppler"
  secret_key  = "DOPPLER_TOKEN"

  lps      = "${var.landscape}-${var.platform}-${var.service}"
  lps-fqdn = "${var.landscape}.${var.platform}.${var.service}"

}