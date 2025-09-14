resource "kubernetes_namespace_v1" "tenant" {
  metadata {
    name = var.name

    annotations = var.instance_pool != null ? {
      "scheduler.alpha.kubernetes.io/node-selector" = "kaas.infomaniak.cloud/instance-pool=${var.instance_pool}"
    } : null
  }
}
