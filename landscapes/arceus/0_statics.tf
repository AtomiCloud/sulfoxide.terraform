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
          slug        = "argocd"
          description = "ArgoCD"
        }
        backup = {
          name        = "Backup Platform"
          slug        = "backup-platform"
          description = "Kubernetes backup platform"
        }
        secrets_engine = {
          name        = "Secrets Engine"
          slug        = "secrets-operator"
          description = "Secrets Engine"
        }
        internal_ingress = {
          name        = "Internal Ingress"
          slug        = "internal-ingress"
          description = "Internal ingress with VPN"
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

}