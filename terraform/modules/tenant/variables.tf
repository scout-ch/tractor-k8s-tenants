variable "user_name" {
  type     = string
  nullable = false
}

variable "name" {
  type     = string
  nullable = false
}

variable "instance_pool" {
  type     = string
  nullable = true
  default  = null
}

variable "cluster_info" {
  type = object({
    name     = string
    endpoint = string
    ca       = string
  })
}
