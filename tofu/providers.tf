provider "infomaniak" {
  host = "https://api.infomaniak.com"
}

provider "kubernetes" {
  host                   = module.tractor_k8s_shared.k8s_config.host
  client_certificate     = module.tractor_k8s_shared.k8s_config.client_certificate
  client_key             = module.tractor_k8s_shared.k8s_config.client_key
  cluster_ca_certificate = module.tractor_k8s_shared.k8s_config.cluster_ca_certificate
}

provider "github" {
  owner = "scout-ch"
}

provider "flux" {
  kubernetes = {
    host                   = module.tractor_k8s_shared.k8s_config.host
    client_certificate     = module.tractor_k8s_shared.k8s_config.client_certificate
    client_key             = module.tractor_k8s_shared.k8s_config.client_key
    cluster_ca_certificate = module.tractor_k8s_shared.k8s_config.cluster_ca_certificate
  }
  git = {
    url = "ssh://git@github.com/${module.flux.config_repository_full_name}.git"
    ssh = {
      username    = "git"
      private_key = module.flux.flux_private_key
    }
  }
}

provider "tls" {}
