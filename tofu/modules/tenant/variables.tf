variable "tenant_name" {
  type = string
}

variable "cluster_config_repository" {
  description = "The name of the GitHub repository containing the cluster configuration for the shared K8s cluster"
  type        = string
}

variable "instance_pool" {
  description = "The instance pool to use for the tenant's workloads"
  type        = string
  nullable    = true
  default     = null
}

variable "users" {
  description = "A map for users that should have access to the tenant's resources"
  type        = map(string)
  default     = {}
}

variable "webhook_ingress_host" {
  description = "The ingress host for the Flux webhook (if any)"
  type        = string
  nullable    = true
  default     = null
}

variable "tenant_config_repo_kustomize_path" {
  description = "The kustomize path within the tenant's config repository"
  type        = string
  default     = "."
}

variable "visibility" {
  description = "The visibility of the GitHub repository (e.g., 'private' or 'public')"
  type        = string
  default     = "private"
}
