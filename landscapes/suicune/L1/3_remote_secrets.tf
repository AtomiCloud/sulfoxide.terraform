data "aws_ssm_parameter" "cloudflare_token" {
  provider = aws.main
  name     = "/terraform/cloudflare_token"
}