locals {
  # aws
  aws_region = "ap-southeast-1"

  # main cluster
  vultr_region  = "sgp"
  instance_type = "vc2-1c-2gb"
  k8s_version   = "v1.27.2+1"
  min_nodes     = 1
  max_nodes     = 3
  landscape     = "pichu"
}