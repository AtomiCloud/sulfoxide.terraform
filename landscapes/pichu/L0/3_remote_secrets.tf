data "hcp_vault_secrets_app" "infrastructure" {
  provider = hcp.main_hcp
  app_name = "Infrastructure"
}

