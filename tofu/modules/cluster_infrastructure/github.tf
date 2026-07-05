resource "github_repository_file" "gateway_api_crds" {
  repository = var.cluster_config_repository
  file       = "${var.cluster_config_path}/infrastructure/gateway-api-crds.yaml"
  content    = file("${path.module}/resources/gateway-api-crds.yaml")

  lifecycle {
    enabled = var.enable.gateway_api_crds
  }
}

resource "github_repository_file" "traefik" {
  repository = var.cluster_config_repository
  file       = "${var.cluster_config_path}/infrastructure/traefik.yaml"
  content = templatefile("${path.module}/resources/traefik.tftpl", {
    instance_pool         = var.instance_pool
    load_balancer_ip      = var.load_balancer_ip
    service_name_override = "traefik-${var.cluster_name}"
    min_replicas          = var.traefik_autoscale.min_replicas
    max_replicas          = var.traefik_autoscale.max_replicas
  })

  lifecycle {
    enabled = var.enable.traefik
  }
}

resource "github_repository_file" "cert_manager" {
  repository = var.cluster_config_repository
  file       = "${var.cluster_config_path}/infrastructure/cert-manager.yaml"
  content = templatefile("${path.module}/resources/cert-manager.tftpl", {
    instance_pool = var.instance_pool
  })

  lifecycle {
    enabled = var.enable.cert_manager
  }
}

resource "github_repository_file" "metrics_server" {
  repository = var.cluster_config_repository
  file       = "${var.cluster_config_path}/infrastructure/metrics-server.yaml"
  content = templatefile("${path.module}/resources/metrics-server.tftpl", {
    instance_pool = var.instance_pool
  })

  lifecycle {
    enabled = var.enable.metrics_server
  }
}

resource "github_repository_file" "velero" {
  repository = var.cluster_config_repository
  file       = "${var.cluster_config_path}/infrastructure/velero.yaml"
  content = templatefile("${path.module}/resources/velero.tftpl", {
    schedule                                 = var.velero_schedule
    velero_infomaniak_backup_location_bucket = var.cluster_name
    velero_infomaniak_backup_location_s3_url = var.velero_infomaniak_backup_location.s3_url
    instance_pool                            = var.instance_pool
  })

  lifecycle {
    enabled = var.enable.velero
  }
}

resource "github_repository_file" "external_snapshotter" {
  repository = var.cluster_config_repository
  file       = "${var.cluster_config_path}/infrastructure/external-snapshotter.yaml"
  content = templatefile("${path.module}/resources/external-snapshotter.tftpl", {
    instance_pool = var.instance_pool
  })

  lifecycle {
    enabled = var.enable.external_snapshotter
  }
}

resource "github_repository_file" "kyverno" {
  repository = var.cluster_config_repository
  file       = "${var.cluster_config_path}/infrastructure/kyverno.yaml"
  content = templatefile("${path.module}/resources/kyverno.tftpl", {
    instance_pool = var.instance_pool
    policies = {
      "instance-pool-selector" = var.kyverno_policies.instance_pool_selector
    }
  })

  lifecycle {
    enabled = var.enable.kyverno
  }
}
