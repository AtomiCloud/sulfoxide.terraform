locals {
  # project id
  hcp_project_id = "c39de26f-c8a3-4260-b196-eb1628105fae"

  # main cluster
  instance_type = "vc2-1c-2gb"
  region        = "sgp"
  k8s_version   = "v1.27.2+1"
  min_nodes     = 1
  max_nodes     = 3
  landscape     = "pichu"
}