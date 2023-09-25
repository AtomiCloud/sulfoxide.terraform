data "doppler_secrets" "suicune_sulfoxide_sos" {
  config  = local.landscapes.suicune.slug
  project = "${local.platforms.sulfoxide.slug}-${local.platforms.sulfoxide.services.sos.slug}"
}
