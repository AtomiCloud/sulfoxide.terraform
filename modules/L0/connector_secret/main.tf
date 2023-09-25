resource "doppler_secret" "cluster_connector" {
  config  = var.landscape
  name    = var.secret_name
  project = var.project_name
  value = jsonencode({
    name   = var.name
    server = var.server
    config = var.config
  })
}