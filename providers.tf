terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.38.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.26.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.12.1"
    }
  }
  #Exemplo
  #backend "s3" {
  #  bucket = "<SEU_BUCKET>"
  #  key    = "<PASTA>/terraform.tfstate"
  #  region = "<REGIAO_DO_BUCKET>"
  #}

}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = var.contexto
}

provider "helm" {
  kubernetes {
      config_path    = "~/.kube/config"
      config_context = var.contexto
  }
}