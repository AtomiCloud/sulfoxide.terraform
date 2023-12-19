module "opal_vcluster_db" {
  source = "../../../modules/L2/digitalocean_mysql"

  providers = {
    digitalocean = digitalocean.opal
  }

  landscape = local.landscape
  platform  = local.platforms.sulfoxide.slug
  service   = local.platforms.sulfoxide.services.vcluster.slug
  module    = "pichu-mysql"


  databases = {
    "pichu_opal"   = "pichu_admin"
    "pikachu_opal" = "pikachu_admin"
    "raichu_opal"  = "raichu_admin"
  }
  region = local.regions.digital_ocean
}

resource "doppler_secret" "entei_vcluster_db_endpoint" {
  for_each = module.opal_vcluster_db.db_name

  project = "${local.platforms.sulfoxide.slug}-${local.platforms.sulfoxide.services.vcluster.slug}"
  config  = local.landscape

  name  = "${upper(each.key)}_K3S_DATASTORE_ENDPOINT"
  value = "mysql://${module.opal_vcluster_db.username}:${module.opal_vcluster_db.password}@tcp(${module.opal_vcluster_db.host}:${module.opal_vcluster_db.port})/${module.opal_vcluster_db.db_name[each.key]}"
}

resource "doppler_secret" "entei_vcluster_db_ca" {
  for_each = module.opal_vcluster_db.db_name

  project = "${local.platforms.sulfoxide.slug}-${local.platforms.sulfoxide.services.vcluster.slug}"
  config  = local.landscape

  name  = "${upper(each.key)}_K3S_DATASTORE_CA"
  value = module.opal_vcluster_db.ca
}