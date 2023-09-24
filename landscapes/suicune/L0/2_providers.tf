provider "digitalocean" {
  alias = "opal"
  token = module.terraform_suicune_secrets.secrets["OPAL_DIGITALOCEAN_TOKEN"].value
}

#provider "digitalocean" {
#  alias = "ruby"
#  token = data.aws_ssm_parameter.do_token_pichu_opal.value
#}
