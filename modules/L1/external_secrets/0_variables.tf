variable "additional_labels" {
  type    = map(string)
  default = {}
}

# service tree
variable "landscape" {
  type = string
}

variable "platform" {
  type = string
}

variable "service" {
  type = string
}

variable "root_secret" {
  description = "Root secret for infisical, from secret of secrets vault"
  type        = string
  sensitive   = true
}