module "opal_vcluster" {
  source = "../../../modules/L2/neon"

  providers = {
    neon = neon.main
  }

  landscape = local.landscape
  platform  = local.platforms.sulfoxide.slug
  service   = local.platforms.sulfoxide.services.vcluster.slug
  module    = "database"


  databases = {
    pichu   = "pichu_admin"
    pikachu = "pikachu_admin"
    raichu  = "raichu_admin"
  }
  region = local.regions.neon
}

resource "doppler_secret" "entei_vcluster_user" {
  for_each = module.opal_vcluster.username

  project = "${local.platforms.sulfoxide.slug}-${local.platforms.sulfoxide.services.vcluster.slug}"
  config  = local.landscape

  name  = "${upper(each.key)}_K3S_DATASTORE_ENDPOINT"
  value = "postgres://${each.value}:${module.opal_vcluster.password[each.key]}@${module.opal_vcluster.host}/${module.opal_vcluster.db_name[each.key]}"
}