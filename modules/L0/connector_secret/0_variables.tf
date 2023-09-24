# infisical
variable "infisical_host" {
  description = "Infisical Host URL"
  type        = string
}

variable "infisical_root_token" {
  description = "Infisical root token"
  type        = string
  sensitive   = true
}

variable "landscape" {
  type        = string
  description = "Landscape to deploy"
}

variable "project_name" {
  type    = string
  default = "Name of project to store secrets"
}

variable "secret_name" {
  type        = string
  description = "Name of Secret to write as"
}

variable "path_secret" {
  type        = string
  description = "Path to secret"
}

variable "name" {
  type = string
}

variable "server" {
  type = string
}

variable "config" {
  type = string
}