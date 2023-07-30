data "aws_ssm_parameter" "vultr_key" {
  provider = aws.main
  name     = "/terraform/vultr_token"
}

data "aws_ssm_parameter" "cloudflare_token" {
  provider = aws.main
  name     = "/terraform/cloudflare_token"
}