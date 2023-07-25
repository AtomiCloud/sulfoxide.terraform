provider "vultr" {
  alias       = "main"
  api_key     = data.hcp_vault_secrets_app.infrastructure.secrets["VULTR_API_KEY"]
  rate_limit  = 100
  retry_limit = 3
}
