resource "cloudflare_r2_bucket" "main" {
  account_id = var.cf_account_id
  name       = "${var.landscape}-${var.platform}-${var.service}-bucket"
  location   = var.cf_region
}