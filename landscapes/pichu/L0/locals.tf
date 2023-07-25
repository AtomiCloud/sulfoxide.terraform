locals {
  instance_type = "vc2-1c-2gb"
  region        = "sgp"
  k8s_version   = "v1.27.2+1"
  min_nodes     = 1
  max_nodes     = 3
  landscape     = "pichu"
}