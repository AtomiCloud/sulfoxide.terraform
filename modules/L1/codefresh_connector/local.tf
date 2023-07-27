locals {

  labels = merge({
    "atomi.cloud/landscape" = var.landscape
    "atomi.cloud/platform"  = var.platform
    "atomi.cloud/service"   = var.service
    "atomi.cloud/module"    = var.module
  }, var.additional_labels)

  annotations = merge({
    "atomi.cloud/landscape" = var.landscape
    "atomi.cloud/platform"  = var.platform
    "atomi.cloud/service"   = var.service
    "atomi.cloud/module"    = var.module
  }, var.additional_labels)

}