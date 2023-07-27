provider "vultr" {
  alias       = "main"
  api_key     = data.aws_ssm_parameter.vultr_key.value
  rate_limit  = 100
  retry_limit = 3
}
