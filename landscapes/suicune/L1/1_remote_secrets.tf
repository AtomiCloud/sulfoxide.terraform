provider "doppler" {
  doppler_token = var.doppler_token
}

data "doppler_secrets" "suicune_sulfoxide_terraform" {
  config  = local.landscapes.suicune.slug
  project = "${local.platforms.sulfoxide.slug}-${local.platforms.sulfoxide.services.terraform.slug}"
}

data "doppler_secrets" "arceus_sulfoxide_terraform" {
  config  = local.landscapes.arceus.slug
  project = "${local.platforms.sulfoxide.slug}-${local.platforms.sulfoxide.services.terraform.slug}"
}