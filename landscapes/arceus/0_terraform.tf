terraform {

  backend "remote" {
    organization = "Atomi-Cloud"

    workspaces {
      name = "arceus"
    }
  }

  required_providers {
    doppler = {
      source  = "DopplerHQ/doppler"
      version = "1.3.0"
    }
  }
}
