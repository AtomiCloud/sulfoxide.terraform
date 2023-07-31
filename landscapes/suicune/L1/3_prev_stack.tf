data "terraform_remote_state" "L0" {
  backend = "remote"

  config = {
    organization = "Atomi-Cloud"
    workspaces = {
      name = "suicune-l0"
    }
  }
}

locals {

  opal_cluster = {
    id          = data.terraform_remote_state.L0.outputs.opal_cluster_id
    endpoint    = data.terraform_remote_state.L0.outputs.opal_cluster_endpoint
    kube_config = data.terraform_remote_state.L0.outputs.opal_cluster_config
  }

}
