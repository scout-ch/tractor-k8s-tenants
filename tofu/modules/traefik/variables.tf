variable "cluster_config_repository" {
  description = "The GitHub repository containing the cluster configuration for the shared K8s cluster"
  type        = string
}

variable "cluster_config_path" {
  description = "Path to the cluster config"
  type        = string
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
