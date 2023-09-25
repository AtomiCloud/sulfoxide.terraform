provider "doppler" {
  doppler_token = var.doppler_token
}

data "doppler_secrets" "sulfoxide_terraform" {
  config  = local.landscapes.suicune.slug
  project = "${local.platforms.sulfoxide.slug}-${local.platforms.sulfoxide.services.terraform.slug}"
}

#data "aws_ssm_parameter" "do_token_pichu_opal" {
#  provider = aws.main
#  name     = "/root/manual/terraform/pichu-opal-digital-ocean-token"
#}
