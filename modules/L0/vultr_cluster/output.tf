output "kube_config" {
  value     = vultr_kubernetes.cluster.kube_config
  sensitive = true

}

output "endpoint" {
  value = vultr_kubernetes.cluster.endpoint
}

output "id" {
  value = vultr_kubernetes.cluster.id
}