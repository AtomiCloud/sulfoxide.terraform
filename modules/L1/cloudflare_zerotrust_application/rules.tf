
resource "cloudflare_device_posture_rule" "warp" {
  account_id = var.cloudflare_account_id
  name       = "${var.landscape}-${var.cluster}-warp"
  type       = "warp"
}
