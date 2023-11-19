# opal
#output "opal_cluster_id" {
#  value = module.cluster_opal.id
#}
#
#output "opal_cluster_endpoint" {
#  value = module.cluster_opal.endpoint
#}
#
#output "opal_cluster_config" {
#  value     = module.cluster_opal.kube_config
#  sensitive = true
#}

# ruby
output "ruby_cluster_id" {
  value = module.cluster_ruby.id
}

output "ruby_cluster_endpoint" {
  value = module.cluster_ruby.endpoint
}

output "ruby_cluster_config" {
  value     = module.cluster_ruby.kube_config
  sensitive = true
}