terraform {
  required_providers {
    aws        = {
      source  = "hashicorp/aws"
      version = "~> 4.18.0"
    }
    null       = {
      source  = "hashicorp/null"
      version = "~> 3.1.0"
    }
    random     = {
      source  = "hashicorp/random"
      version = "~> 3.1.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.8.0"
    }
    kubectl    = {
      source  = "gavinbunney/kubectl"
      version = "~> 1.14.0"
    }
  }
}