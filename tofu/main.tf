terraform {
  backend "kubernetes" {
    secret_suffix  = "state"
    config_path    = "~/.kube/config"
    config_context = "kubernetes-admin@pck-8kxhclv"
    namespace      = "tractor-k8s-tenants"
  }

  required_providers {
    flux = {
      source  = "fluxcd/flux"
      version = "1.7.6"
    }
    github = {
      source  = "integrations/github"
      version = "6.9.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.1.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "3.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
  }
}

locals {
  cluster_name         = "tractor-k8s-shared"
  cluster_webhook_host = "flux.k8s.tractor.scout.ch"
  cluster_info = {
    name     = "pck-8kxhclv"
    endpoint = "https://83.166.143.133:30566"
    ca       = file("./ca.crt")
  }
}
