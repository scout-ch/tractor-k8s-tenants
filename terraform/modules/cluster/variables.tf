variable "users" {
  type = map(object({
    default_namespace = string
    namespaces        = set(string)
  }))
}

variable "admin_users" {
  type = set(string)
}

variable "additional_namespaces" {
  type = set(string)
}

variable "cluster_info" {
  type = object({
    name     = string
    endpoint = string
    ca       = string
  })
}

variable "namespace_configs" {
  description = "Additional config for namespaces. No config is needed here to create a namespace and no namespace will be creaetd if it is not referenced."
  type = map(object({
    instance_pool = optional(string, null)
  }))
}
