terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = ">=6.8.3, <7.0.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">=3.0.0, <4.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">=3.4.3, <4.0.0"
    }
  }
}
