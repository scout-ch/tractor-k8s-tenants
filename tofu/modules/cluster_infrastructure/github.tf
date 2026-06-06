resource "github_repository_file" "traefik" {
  repository = var.cluster_config_repository
  file       = "${var.cluster_config_path}/infrastructure/traefik.yaml"
  content = templatefile("${path.module}/resources/traefik.tftpl", {
    instance_pool         = var.instance_pool
    load_balancer_ip      = var.load_balancer_ip
    service_name_override = "traefik-${var.cluster_name}"
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

resource "github_repository_file" "velero" {
  repository = var.cluster_config_repository
  file       = "${var.cluster_config_path}/infrastructure/velero.yaml"
  content = templatefile("${path.module}/resources/velero.tftpl", {
    schedule       = var.velero_schedule
    storage_prefix = var.cluster_name
  })

  lifecycle {
    enabled = var.enable.velero
  }
}

resource "github_repository_file" "velero_secret" {
  repository = var.cluster_config_repository
  file       = "manual/clusters/${var.cluster_name}/velero-secret.yaml"
  content    = templatefile("${path.module}/resources/velero-secret.tftpl", var.velero_infomaniak_backup_location)

  lifecycle {
    enabled = var.enable.velero
  }
}
