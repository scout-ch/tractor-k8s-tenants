provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "kubernetes-admin@pck-8kxhclv"
}

provider "github" {
  owner = "scout-ch"
}

provider "flux" {
  kubernetes = {
    config_path    = "~/.kube/config"
    config_context = "kubernetes-admin@pck-8kxhclv"
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
