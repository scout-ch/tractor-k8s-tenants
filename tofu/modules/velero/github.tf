resource "github_repository_file" "this" {
  repository = var.github_repository
  file       = "infrastructure/velero/velero.yaml"
  content    = file("${path.module}/resources/velero.yaml")
}

resource "github_repository_file" "backup_storage_location" {
  repository = var.github_repository
  file       = "infrastructure/backup-storage-location/backup-storage-location.yaml"
  content    = file("${path.module}/resources/backup-storage-location.yaml")
}

resource "github_repository_file" "backup_schedule" {
  repository = var.github_repository
  file       = "infrastructure/backup-schedule/backup-schedule.yaml"
  content    = file("${path.module}/resources/backup-schedule.yaml")
}

resource "github_repository_file" "manual_backup" {
  repository = var.github_repository
  file       = "manual/one-shot/manual-backup.yaml"
  content    = file("${path.module}/resources/manual-backup.yaml")
}

resource "github_repository_file" "manual_restore" {
  repository = var.github_repository
  file       = "manual/one-shot/manual-restore.yaml"
  content    = file("${path.module}/resources/manual-restore.yaml")
}
