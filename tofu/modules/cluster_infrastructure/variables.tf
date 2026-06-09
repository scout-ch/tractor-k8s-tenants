variable "cluster_config_repository" {
  description = "The GitHub repository containing the cluster configuration for the shared K8s cluster"
  type        = string
  nullable    = false
}

variable "cluster_config_path" {
  description = "Path to the cluster config"
  type        = string
  nullable    = false
}

variable "cluster_name" {
  description = "Name of the cluster, used for naming resources"
  type        = string
  nullable    = false
}

variable "instance_pool" {
  description = "Node selector instance pool"
  type        = string
  default     = null
}

variable "load_balancer_ip" {
  description = "IP to set on the loadbalancer"
  type        = string
  default     = null
}

variable "enable" {
  description = "Selectively enable or disable certain infrastructure"
  type = object({
    traefik              = optional(bool, true)
    cert_manager         = optional(bool, true)
    metrics_server       = optional(bool, true)
    velero               = optional(bool, true)
    external_snapshotter = optional(bool, true)
  })
  default = {
    traefik              = true
    cert_manager         = true
    metrics_server       = true
    velero               = true
    external_snapshotter = true
  }
  validation {
    condition     = var.enable.velero == false || var.velero_infomaniak_backup_location_s3_url != null
    error_message = "Velero backup location details must be provided when Velero is enabled"
  }
}

variable "velero_schedule" {
  description = "Cron schedule for Velero backup jobs"
  type        = string
  default     = null
}

variable "velero_infomaniak_backup_location_s3_url" {
  description = "Velero storage location for backups"
  type        = string
  default     = null
}
