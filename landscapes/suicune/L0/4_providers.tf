provider "digitalocean" {
  alias = "main"
  token = data.aws_ssm_parameter.digital_ocean_token.value
}