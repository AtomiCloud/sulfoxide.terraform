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

# ArgoCD
module "sulfoxide_helium_doppler" {
  source = "../../modules/L0/doppler"

  landscapes = merge(local.doppler_landscapes.a)
  platform   = local.platforms.sulfoxide.slug
  service    = local.platforms.sulfoxide.services.argocd.slug

  description = "Secrets for ${local.platforms.sulfoxide.services.argocd.description}"
  sos_project = local.sos_project

  store_service_token = true
}

# Internal Ingress
module "sulfoxide_boron_doppler" {
  source = "../../modules/L0/doppler"

  landscapes = merge(local.doppler_landscapes.a, local.doppler_landscapes.v, local.doppler_landscapes.p)
  platform   = local.platforms.sulfoxide.slug
  service    = local.platforms.sulfoxide.services.internal_ingress.slug

  description = "Secrets for ${local.platforms.sulfoxide.services.internal_ingress.description}"
  sos_project = local.sos_project

  store_service_token = true
}

# External Ingress
module "sulfoxide_oxygen_doppler" {
  source = "../../modules/L0/doppler"

  landscapes = merge(local.doppler_landscapes.p)
  platform   = local.platforms.sulfoxide.slug
  service    = local.platforms.sulfoxide.services.external_ingress.slug

  description = "Secrets for ${local.platforms.sulfoxide.services.external_ingress.description}"
  sos_project = local.sos_project

  store_service_token = true
}

# Pod Autoscaler KEDA
module "sulfoxide_iron_doppler" {
  source = "../../modules/L0/doppler"

  landscapes = merge(local.doppler_landscapes.v)
  platform   = local.platforms.sulfoxide.slug
  service    = local.platforms.sulfoxide.services.scaler.slug

  description = "Secrets for ${local.platforms.sulfoxide.services.scaler.description}"
  sos_project = local.sos_project

  store_service_token = true
}

# Policy Engine
module "sulfoxide_argon_doppler" {
  source = "../../modules/L0/doppler"

  landscapes = merge(local.doppler_landscapes.v)
  platform   = local.platforms.sulfoxide.slug
  service    = local.platforms.sulfoxide.services.policy_engine.slug

  description = "Secrets for ${local.platforms.sulfoxide.services.policy_engine.description}"
  sos_project = local.sos_project

  store_service_token = true
}

# Policies
module "sulfoxide_sodium_doppler" {
  source = "../../modules/L0/doppler"

  landscapes = merge(local.doppler_landscapes.v)
  platform   = local.platforms.sulfoxide.slug
  service    = local.platforms.sulfoxide.services.policies.slug

  description = "Secrets for ${local.platforms.sulfoxide.services.policies.description}"
  sos_project = local.sos_project

  store_service_token = true
}

# Cert Manager
module "sulfoxide_sulfur_doppler" {
  source = "../../modules/L0/doppler"

  landscapes = merge(local.doppler_landscapes.v, local.doppler_landscapes.p)
  platform   = local.platforms.sulfoxide.slug
  service    = local.platforms.sulfoxide.services.cert_manager.slug

  description = "Secrets for ${local.platforms.sulfoxide.services.cert_manager.description}"
  sos_project = local.sos_project

  store_service_token = true
}

# Cluster Issuer
module "sulfoxide_zinc_doppler" {
  source = "../../modules/L0/doppler"

  landscapes = merge(local.doppler_landscapes.v, local.doppler_landscapes.p)
  platform   = local.platforms.sulfoxide.slug
  service    = local.platforms.sulfoxide.services.cluster_issuer.slug

  description = "Secrets for ${local.platforms.sulfoxide.services.cluster_issuer.description}"
  sos_project = local.sos_project

  store_service_token = true
}

# OTEL Operator
module "sulfoxide_lithium_doppler" {
  source = "../../modules/L0/doppler"

  landscapes = merge(local.doppler_landscapes.v, local.doppler_landscapes.p)
  platform   = local.platforms.sulfoxide.slug
  service    = local.platforms.sulfoxide.services.otel_operator.slug

  description = "Secrets for ${local.platforms.sulfoxide.services.otel_operator.description}"
  sos_project = local.sos_project

  store_service_token = true
}

# OTEL Collector
module "sulfoxide_silicon_doppler" {
  source = "../../modules/L0/doppler"

  landscapes = merge(local.doppler_landscapes.v, local.doppler_landscapes.p)
  platform   = local.platforms.sulfoxide.slug
  service    = local.platforms.sulfoxide.services.otel_collector.slug

  description = "Secrets for ${local.platforms.sulfoxide.services.otel_collector.description}"
  sos_project = local.sos_project

  store_service_token = true
}

# Backup Engine
module "sulfoxide_fluorine_doppler" {
  source = "../../modules/L0/doppler"

  landscapes = merge(local.doppler_landscapes.a)
  platform   = local.platforms.sulfoxide.slug
  service    = local.platforms.sulfoxide.services.backup_engine.slug

  description = "Secrets for ${local.platforms.sulfoxide.services.backup_engine.description}"
  sos_project = local.sos_project

  store_service_token = true
}

# Secret Engine
module "sulfoxide_cobalt_doppler" {
  source = "../../modules/L0/doppler"

  landscapes = merge(local.doppler_landscapes.a, local.doppler_landscapes.v, local.doppler_landscapes.p)
  platform   = local.platforms.sulfoxide.slug
  service    = local.platforms.sulfoxide.services.secrets_engine.slug

  description = "Secrets for ${local.platforms.sulfoxide.services.secrets_engine.description}"
  sos_project = local.sos_project

  store_service_token = true
}

# External DNS
module "sulfoxide_tin_doppler" {
  source = "../../modules/L0/doppler"

  landscapes = merge(local.doppler_landscapes.p)
  platform   = local.platforms.sulfoxide.slug
  service    = local.platforms.sulfoxide.services.external_dns.slug

  description = "Secrets for ${local.platforms.sulfoxide.services.external_dns.description}"
  sos_project = local.sos_project

  store_service_token = true
}


