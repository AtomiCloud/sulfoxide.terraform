variable "additional_labels" {
  type    = map(string)
  default = {}
}

# service tree
variable "landscape" {
  description = "Name of the landscape"
  type        = string
}

variable "platform" {
  description = "Name of the platform"
  type        = string
}

variable "service" {
  description = "Name of the service"
  type        = string
}

variable "root_secret" {
  description = "Root secret for doppler, for secret of secrets vault"
  type        = string
  sensitive   = true
}