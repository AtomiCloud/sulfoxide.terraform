output "kube_config" {
  value     = digitalocean_kubernetes_cluster.cluster.kube_config
  sensitive = true

}

output "endpoint" {
  value = digitalocean_kubernetes_cluster.cluster.endpoint
}

output "id" {
  value = digitalocean_kubernetes_cluster.cluster.id
}