resource "kubernetes_secret_v1" "velero_secret" {
  metadata {
    name      = "infomaniak-s3-credentials"
    namespace = "velero"
  }

  type = "Opaque"

  data = {
    "tractor-k8s-backup" = templatefile("${path.module}/resources/velero-secret.tftpl", var.velero_infomaniak_backup_location.s3_credentials)
  }

  lifecycle {
    enabled = var.enable.velero
  }
}
