locals {
  common_labels = {
    project     = var.project_name
    environment = var.environment
    managed_by  = "terraform"
  }
}

resource "terraform_data" "oracle_lab" {
  input = {
    project           = var.project_name
    environment       = var.environment
    operating_system  = "RHEL 9.8"
    container_runtime = "Podman"
    database_target   = "Oracle Database 19c"
  }
}
