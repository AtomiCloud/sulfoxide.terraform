locals {

  platforms = {

    sulfoxide = {
      name = "Sulfoxide"
      slug = "sulfoxide"
      services = {
        sos = {
          name        = "Secret of secrets"
          slug        = "sos"
          description = "Secrets of other doppler secrets"
        }
        terraform = {
          name        = "Terraform"
          slug        = "terraform"
          description = "Terraform"
        }
        argocd = {
          name        = "ArgoCD"
          slug        = "helium"
          description = "Deployment platform using GitOps"
        }
        backup_engine = {
          name        = "Backup Engine"
          slug        = "fluorine"
          description = "Velero as the backup engine for Kubernetes"
        }
        secrets_engine = {
          name        = "Secrets Engine"
          slug        = "cobalt"
          description = "External Secrets to sync secrets from doppler"
        }
        internal_ingress = {
          name        = "Internal Ingress"
          slug        = "boron"
          description = "Internal Ingress with cloudflared"
        }
        external_ingress = {
          name        = "External Ingress"
          slug        = "oxygen"
          description = "External Ingress with Kong"
        }
        scaler = {
          name        = "Pod Autoscaler"
          slug        = "iron"
          description = "KEDA scaler for pods"
        }
        cluster_issuer = {
          name        = "Cluster Issuer"
          slug        = "zinc"
          description = "Cluster Issuer for Certificate"
        }
        cert_manager = {
          name        = "Cert Manager"
          slug        = "sulfur"
          description = "Certificate Issuing operator"
        }
        reloader = {
          name        = "Reloader"
          slug        = "chlorine"
          description = "Reloader"
        }
        policy_engine = {
          name        = "Policy Engine"
          slug        = "argon"
          description = "Kyverno operator"
        }
        policies = {
          name        = "Policies"
          slug        = "sodium"
          description = "Kyverno policies"
        }
        otel_collector = {
          name        = "OpenTelemetry Collector"
          slug        = "silicon"
          description = "OpenTelemetry Collector"
        }
        otel_operator = {
          name        = "OpenTelemetry Operator"
          slug        = "lithium"
          description = "OpenTelemetry Operator"
        }
        traefik = {
          name        = "Traefik"
          slug        = "gold"
          description = "Traefik"
        }
        external_dns = {
          name        = "External DNS"
          slug        = "tin"
          description = "External DNS"
        }
      }
    }

  }

  landscapes = {

    arceus = {
      name        = "Arceus"
      slug        = "arceus"
      description = "Global meta landscape-agnostic administrative environment"
    }

    pinsir = {
      name        = "Pinsir"
      slug        = "pinsir"
      description = "Continuous Integration"
    }

    lapras = {
      name        = "Lapras"
      slug        = "lapras"
      description = "Local development"
    }

    tauros = {
      name        = "Tauros"
      slug        = "tauros"
      description = "Test environment"
    }

    absol = {
      name        = "Absol"
      slug        = "absol"
      description = "Local Development (Production Parity)"

    }

    pichu = {
      name        = "Pichu"
      slug        = "pichu"
      description = "Singapore Development Environment"
    }

    pikachu = {
      name        = "Pikachu"
      slug        = "pikachu"
      description = "Singapore Staging Environment"
    }

    raichu = {
      name        = "Raichu"
      slug        = "raichu"
      description = "Singapore Production Environment"
    }

    suicune = {
      name        = "Suicune"
      slug        = "suicune"
      description = "Singapore administrative environment"
    }

    entei = {
      name        = "Entei"
      slug        = "entei"
      description = "Singapore physical landscape"
    }


  }


  doppler_landscapes = {
    a = {
      (local.landscapes.suicune.slug) = local.landscapes.suicune.name
    }
    v = {
      (local.landscapes.pichu.slug)   = local.landscapes.pichu.name
      (local.landscapes.pikachu.slug) = local.landscapes.pikachu.name
      (local.landscapes.raichu.slug)  = local.landscapes.raichu.name
    }
    p = {
      (local.landscapes.entei.slug) = local.landscapes.entei.name

    }
  }

}