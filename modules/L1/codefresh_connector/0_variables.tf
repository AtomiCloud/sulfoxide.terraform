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

variable "module" {
  type = string
}

# extra
variable "cluster_name" {
  type = string
}

# configuration
variable "token" {
  type      = string
  sensitive = true
}

variable "ingress" {
  type = string
}


variable "cluster_endpoint" {
  type = string
}

variable "additional_labels" {
  type    = map(string)
  default = {}
}