resource "github_repository_file" "this" {
  repository = var.cluster_config_repository
  file       = "infrastructure/traefik/traefik.yaml"
  content = templatefile("${path.module}/resources/traefik.tftpl", {
    instance_pool    = var.instance_pool
    load_balancer_ip = var.load_balancer_ip
  })
}

resource "github_repository_file" "kustomization" {
  repository = var.cluster_config_repository
  file       = "${var.cluster_config_path}/infrastructure/traefik.yaml"
  content    = file("${path.module}/resources/kustomization.yaml")

  depends_on = [github_repository_file.this]
}
