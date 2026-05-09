variable "github_repository" {
  description = "GitHub repository"
  type = object({
    name      = optional(string)
    full_name = optional(string)
  })
  validation {
    condition     = var.github_repository.name != null || var.github_repository.full_name != null
    error_message = "You need supply either a repo name to create it or a full_name to use an exiting one"
  }
}

variable "cluster_name" {
  description = "Name of the Kubernetes cluster"
  type        = string
}

variable "webhook_ingress_host" {
  description = "The host where the webhook receiver will be accessible"
  type        = string
  default     = null
}
