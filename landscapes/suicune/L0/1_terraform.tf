terraform {

  backend "remote" {
    organization = "Atomi-Cloud"

    workspaces {
      name = "suicune-l0"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.9"
    }
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.29"
    }
  }
}