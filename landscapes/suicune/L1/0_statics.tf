locals {

  infisical_url = "https://secrets.atomi.cloud"


  platforms = {

    sulfoxide = {
      name = "Sulfoxide"
      slug = "sulfoxide"
      services = {
        generic = {
          name = "Generic"
          slug = "generic"
        }
        terraform = {
          name = "Terraform"
          slug = "terraform"
        }
        argocd = {
          name = "ArgoCD"
          slug = "argocd"
        }
      }
    }


  }

  landscapes = {

    pinsir = {
      name = "Pinsir"
      slug = "pinsir"
    }

    lapras = {
      name = "Lapras"
      slug = "lapras"
    }

    tauros = {
      name = "Tauros"
      slug = "tauros"
    }

    absol = {
      name = "Absol"
      slug = "absol"
    }

    pichu = {
      name = "Pichu"
      slug = "pichu"
    }

    pikachu = {
      name = "Pikachu"
      slug = "pikachu"
    }

    raichu = {
      name = "Raichu"
      slug = "raichu"
    }

    suicune = {
      name = "Suicune"
      slug = "suicune"
    }

    entei = {
      name = "Entei"
      slug = "entei"
    }


  }

}