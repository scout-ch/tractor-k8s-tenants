variable "infomaniak_public_cloud" {
  description = "Infomaniak public cloud configuration"
  type = object({
    id         = string
    project_id = string
  })
}

variable "cluster" {
  description = "Kubernetes cluster configuration"
  type = object({
    id = string
  })
}
