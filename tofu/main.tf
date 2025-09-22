terraform {
  backend "kubernetes" {
    secret_suffix  = "state"
    config_path    = "~/.kube/config"
    config_context = "kubernetes-admin@pck-8kxhclv"
    namespace      = "tractor-k8s-tenants"
  }

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.38.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">= 4.1.0"
    }
  }
}

locals {
  cluster_info = {
    name     = "pck-8kxhclv"
    endpoint = "https://83.166.143.133:30566"
    ca       = file("./ca.crt")
  }
}
