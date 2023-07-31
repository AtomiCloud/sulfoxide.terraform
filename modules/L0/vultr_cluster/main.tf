resource "vultr_kubernetes" "cluster" {
  region  = var.region
  label   = "${var.landscape}-${var.cluster}-cluster"
  version = var.k8s_version

  node_pools {
    node_quantity = var.min_nodes
    plan          = var.instance_type
    label         = "${var.landscape}-main-pool"
    auto_scaler   = true
    min_nodes     = var.min_nodes
    max_nodes     = var.max_nodes
  }
}