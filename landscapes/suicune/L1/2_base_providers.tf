provider "aws" {
  alias      = "main"
  region     = local.aws_region
  access_key = var.aws_key_id
  secret_key = var.aws_key_secret
}