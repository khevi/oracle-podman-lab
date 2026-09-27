output "project_name" {
  description = "Lab project name"
  value       = var.project_name
}

output "environment" {
  description = "Lab environment"
  value       = var.environment
}

output "common_labels" {
  description = "Common labels for future infrastructure resources"
  value       = local.common_labels
}
