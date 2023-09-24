terraform {

  backend "remote" {
    organization = "Atomi-Cloud"

    workspaces {
      name = "suicune-l0"
    }
  }
  required_providers {
    infisical = {
      source  = "Infisical/infisical"
      version = "0.3.2"
    }
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.29"
    }
  }
}
