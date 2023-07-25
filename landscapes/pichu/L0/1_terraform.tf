terraform {
  required_providers {
    vultr = {
      source  = "vultr/vultr"
      version = "2.15.1"
    }
    hcp = {
      source  = "hashicorp/hcp"
      version = "0.66.0"
    }
  }
}