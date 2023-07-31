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

# aws
variable "aws_region" {
  type = string
}