resource "github_repository_file" "traefik" {
  repository = var.cluster_config_repository
  file       = "${var.cluster_config_path}/infrastructure/traefik.yaml"
  content = templatefile("${path.module}/resources/traefik.tftpl", {
    instance_pool    = var.instance_pool
    load_balancer_ip = var.load_balancer_ip
  })

  lifecycle {
    enabled = var.enable.traefik
  }
}

resource "github_repository_file" "cert_manager" {
  repository = var.cluster_config_repository
  file       = "${var.cluster_config_path}/infrastructure/cert-manager.yaml"
  content    = file("${path.module}/resources/cert-manager.yaml")

  lifecycle {
    enabled = var.enable.cert_manager
  }
}

resource "github_repository_file" "metrics_server" {
  repository = var.cluster_config_repository
  file       = "${var.cluster_config_path}/infrastructure/metrics-server.yaml"
  content    = file("${path.module}/resources/metrics-server.yaml")

  lifecycle {
    enabled = var.enable.metrics_server
  }
}
