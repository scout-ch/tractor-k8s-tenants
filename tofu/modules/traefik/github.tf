resource "github_repository_file" "this" {
  repository = var.cluster_config_repository
  file       = "infrastructure/traefik.yaml"
  content = templatefile("${path.module}/resources/traefik.tftpl", {
    instance_pool = var.instance_pool
  })
}
