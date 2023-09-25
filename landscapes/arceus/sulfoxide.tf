module "sulfoxide_terraform_doppler" {
  source = "../../modules/L0/doppler"

  landscapes = {
    (local.landscapes.suicune.slug) = local.landscapes.suicune.name
    (local.landscapes.entei.slug)   = local.landscapes.entei.name

    (local.landscapes.pichu.slug)   = local.landscapes.pichu.name
    (local.landscapes.pikachu.slug) = local.landscapes.pikachu.name
    (local.landscapes.raichu.slug)  = local.landscapes.raichu.name

    (local.landscapes.arceus.slug) = local.landscapes.arceus.name
  }
  platform = local.platforms.sulfoxide.slug
  service  = local.platforms.sulfoxide.services.terraform.slug

  description = "Sulfoxide Terraform holds secrets for terraform that controls the whole AtomiCloud infrastructure"
  sos_project = local.sos_project

  store_service_token = true
}

module "sulfoxide_argocd_doppler" {
  source = "../../modules/L0/doppler"

  landscapes = {
    (local.landscapes.suicune.slug) = local.landscapes.suicune.name
    (local.landscapes.entei.slug)   = local.landscapes.entei.name

    (local.landscapes.pichu.slug)   = local.landscapes.pichu.name
    (local.landscapes.pikachu.slug) = local.landscapes.pikachu.name
    (local.landscapes.raichu.slug)  = local.landscapes.raichu.name
  }
  platform = local.platforms.sulfoxide.slug
  service  = local.platforms.sulfoxide.services.argocd.slug

  description = "Secrets for ArgoCD for bootstrap engine for AtomiCloud's infrastructure"
  sos_project = local.sos_project

  store_service_token = true
}

