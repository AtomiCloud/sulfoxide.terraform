terraform {

  backend "remote" {
    organization = "Atomi-Cloud"

    workspaces {
      name = "pichu-l0"
    }
  }

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