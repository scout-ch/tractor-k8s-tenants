resource "kubernetes_namespace_v1" "this" {
  metadata {
    name = var.name

    labels = {
      name = var.name
    }

    annotations = var.instance_pool != null ? {
      "tractor.scout.ch/instance-pool" = "${var.instance_pool}"
    } : null
  }
}
