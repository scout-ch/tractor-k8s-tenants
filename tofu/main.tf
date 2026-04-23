terraform {
  backend "pg" {
    conn_str = "postgres://tractor-k8s-tenants-tf@postgres.tractor.scout.ch:5432/tractor-k8s-tenants-tf?sslmode=disable"
  }

  required_providers {
    infomaniak = {
      source  = "Infomaniak/infomaniak"
      version = "1.4.1"
    }
    flux = {
      source  = "fluxcd/flux"
      version = "1.8.6"
    }
    github = {
      source  = "integrations/github"
      version = "6.12.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.2.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "3.1.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.8.1"
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
