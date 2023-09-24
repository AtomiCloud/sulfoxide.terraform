module "terraform_generic_secrets" {
  source = "../../../modules/L0/read_infisical"

  infisical_host       = local.infisical_url
  infisical_root_token = var.infisical_token
  landscape            = "main"
  project_name         = "${upper(local.platforms.sulfoxide.slug)}_${upper(local.platforms.sulfoxide.services.generic.slug)}"
  root_path            = "/"
}