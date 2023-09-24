variable "infisical_root_token" {
  description = "Root token for Infisical Vault"
  type        = string
}

variable "infisical_host" {
  description = "Host for Infisical Vault"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "landscape" {
  description = "Landscape secret"
  type        = string
}

variable "root_path" {
  description = "Root path for Infisical Vault"
  type        = string
}

variable "name" {
  description = "Name of the secret"
  type        = string
}

variable "secret" {
  description = "Value of the secret"
  type        = string
  sensitive   = true
}

variable "delete" {
  description = "Delete the secret"
  type        = bool
  default     = false
}