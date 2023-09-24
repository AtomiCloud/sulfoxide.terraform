provider "infisical" {
  alias         = "root"
  host          = var.infisical_host
  service_token = var.infisical_root_token
}

data "infisical_secrets" "secret_of_secrets" {
  provider    = infisical.root
  env_slug    = var.landscape
  folder_path = "/"
}

provider "infisical" {
  alias         = "actual"
  host          = var.infisical_host
  service_token = data.infisical_secrets.secret_of_secrets.secrets[var.project_name].value
}

data "infisical_secrets" "main" {
  provider    = infisical.actual
  env_slug    = var.landscape
  folder_path = var.root_path
}

