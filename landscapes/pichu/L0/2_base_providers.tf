provider "hcp" {
  alias         = "main_hcp"
  client_id     = var.hcp_client_id
  client_secret = var.hcp_client_secret
  project_id    = local.hcp_project_id
}