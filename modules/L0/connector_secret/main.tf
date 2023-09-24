module "cluster_connector" {
  source = "../write_infisical"

  infisical_host       = var.infisical_host
  infisical_root_token = var.infisical_root_token
  landscape            = var.landscape
  project_name         = var.project_name
  root_path            = var.path_secret

  name = var.secret_name

  secret = jsonencode({
    name   = var.name
    server = var.server
    config = var.config
  })
}