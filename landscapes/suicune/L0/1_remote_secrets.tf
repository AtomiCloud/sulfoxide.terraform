module "terraform_suicune_secrets" {
  source = "../../../modules/L0/read_infisical"

  infisical_host       = local.infisical_url
  infisical_root_token = var.infisical_token
  landscape            = local.landscapes.suicune.slug
  project_name         = "${upper(local.platforms.sulfoxide.slug)}_${upper(local.platforms.sulfoxide.services.terraform.slug)}"
  root_path            = "/"
}

#data "aws_ssm_parameter" "do_token_pichu_opal" {
#  provider = aws.main
#  name     = "/root/manual/terraform/pichu-opal-digital-ocean-token"
#}
