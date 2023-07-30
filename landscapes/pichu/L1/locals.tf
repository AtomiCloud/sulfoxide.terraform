locals {

  # service tree
  landscape = "pichu"
  clusters = {
    opal = "opal"
  }

  # cloudflare
  cf_zone       = "atomi.cloud"
  cf_account_id = "177aa484a66427793543c5e958f8d020"


  # codefresh
  codefresh_ingress = "https://mr-atomicloud-b92f68c.hosted-runtimes.cf-cd.com"

  # aws
  aws_region = "ap-southeast-1"

}