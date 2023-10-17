output "username" {
  value = { for key, role in digitalocean_database_user.this : key => role.name }
}

output "password" {
  value = { for key, role in digitalocean_database_user.this : key => role.password }

}

output "host" {
  value = digitalocean_database_cluster.this.host

}

output "db_name" {
  value = { for key, db in digitalocean_database_db.this : key => db.name }
}

output "ca" {
  value = data.digitalocean_database_ca.ca.certificate
}