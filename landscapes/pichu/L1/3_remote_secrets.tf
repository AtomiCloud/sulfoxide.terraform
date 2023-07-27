data "aws_ssm_parameter" "vultr_key" {
  provider = aws.main
  name     = "/terraform/vultr_token"
}