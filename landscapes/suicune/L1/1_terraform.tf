terraform {

  backend "remote" {
    organization = "Atomi-Cloud"

    workspaces {
      name = "suicune-l1"
    }
  }

  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.10.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.22.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.14"
    }
  }
}
