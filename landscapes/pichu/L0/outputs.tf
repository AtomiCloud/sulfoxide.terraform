output "main_cluster_id" {
  value = module.main_cluster.id
}

output "main_cluster_endpoint" {
  value = module.main_cluster.endpoint
}

output "main_cluster_config" {
  value     = module.main_cluster.kube_config
  sensitive = true
}