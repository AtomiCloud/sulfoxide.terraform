provider "digitalocean" {
  alias = "opal"
  token = data.doppler_secrets.sulfoxide_terraform.map.OPAL_DIGITALOCEAN_TOKEN
}

#provider "digitalocean" {
#  alias = "ruby"
#  token = data.doppler_secrets.sulfoxide_terraform.map.RUBY_DIGITALOCEAN_TOKEN
#}
