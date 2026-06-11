terraform {
  required_version = ">= 1.11, < 2"

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
      version = "1.8.8"
    }
    github = {
      source  = "integrations/github"
      version = "6.12.1"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.3.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "3.2.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.9.0"
    }
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "3.4.0"
    }
  }
}

locals {
  cluster_name         = "tractor-k8s-production"
  cluster_webhook_host = "flux.k8s.tractor.scout.ch"
  cluster_info = {
    name     = "pck-2tvwejg"
    endpoint = "https://83.166.143.133:30988"
    ca       = file("./ca.crt")
  }
}
