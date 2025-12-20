resource "github_repository_file" "kustomization" {
  repository = var.cluster_config_repository
  file       = "${var.cluster_config_path}/infrastructure/traefik.yaml"
  content    = file("${path.module}/resources/kustomization.yaml")
}

resource "github_repository_file" "this" {
  repository = var.cluster_config_repository
  file       = "infrastructure/traefik/traefik.yaml"
  content = templatefile("${path.module}/resources/traefik.tftpl", {
    instance_pool = var.instance_pool
  })
}
