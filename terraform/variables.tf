variable "project_name" {
  description = "Name of the lab project"
  type        = string
  default     = "oracle-podman-lab"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}
