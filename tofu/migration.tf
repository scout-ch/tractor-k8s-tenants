moved {
  from = module.flux.github_repository.this
  to   = github_repository.flux-config
}

moved {
  from = module.cert_manager.github_repository_file.kustomization
  to   = module.infrastructure.github_repository_file.cert_manager
}

moved {
  from = module.metrics_server.github_repository_file.kustomization
  to   = module.infrastructure.github_repository_file.metrics_server
}

moved {
  from = module.traefik.github_repository_file.kustomization
  to   = module.infrastructure.github_repository_file.traefik
}
