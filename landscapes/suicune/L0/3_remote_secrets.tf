data "aws_ssm_parameter" "digital_ocean_token" {
  provider = aws.suicune_opal
  name     = "/terraform/suicune/opal/digital_ocean_token"
}