data "terraform_remote_state" "L0" {
  backend = "remote"

  config = {
    organization = "Atomi-Cloud"
    workspaces = {
      name = "suicune-l0"
    }
  }
}

