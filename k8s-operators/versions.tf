// versions.tf
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.32.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "~> 3.1.0"
    }
  }
}

