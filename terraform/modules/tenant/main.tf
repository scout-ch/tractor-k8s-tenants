resource "random_string" "suffix" {
  length  = 6
  upper   = false
  numeric = true
  special = false
}

locals {
  unique_username = "${var.user_name}-${random_string.suffix.result}"
}
