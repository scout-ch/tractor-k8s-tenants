terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">=3.0.0, <4.0.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">=4.1.0, <5.0.0"
    }
  }
}
