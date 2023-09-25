locals {

  # service tree
  landscape = local.landscapes.suicune.slug

  clusters = {
    opal = "opal"
    ruby = "ruby"

    opal_ruby = "opal-ruby"
  }

  # cloudflare
  cf_zone              = "atomi.cloud"
  cf_account_id        = "177aa484a66427793543c5e958f8d020"
  cf_gateway_policy_id = "274146bb-6ccf-4988-bc61-79a070acbb1a"
  cf_region            = "APAC"

}
