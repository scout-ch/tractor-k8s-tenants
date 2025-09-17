variable "name" {
  type     = string
  nullable = false
}

variable "instance_pool" {
  type     = string
  nullable = true
  default  = null
}
