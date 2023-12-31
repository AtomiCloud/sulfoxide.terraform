module "velero_backup_r2" {

  source = "../../../modules/L2/r2"

  providers = {
    cloudflare = cloudflare.main
  }

  cf_account_id = local.cf_account_id
  cf_region     = local.cf_region
  landscape     = local.landscape
  platform      = local.platforms.sulfoxide.slug
  service       = local.platforms.sulfoxide.services.backup_engine.slug

}