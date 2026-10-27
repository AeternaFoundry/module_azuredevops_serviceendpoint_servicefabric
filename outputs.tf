output "serviceendpoint_servicefabrics_id" {
  description = "Map of id values across all serviceendpoint_servicefabrics, keyed the same as var.serviceendpoint_servicefabrics"
  value       = { for k, v in azuredevops_serviceendpoint_servicefabric.serviceendpoint_servicefabrics : k => v.id }
}
output "serviceendpoint_servicefabrics_authorization" {
  description = "Map of authorization values across all serviceendpoint_servicefabrics, keyed the same as var.serviceendpoint_servicefabrics"
  value       = { for k, v in azuredevops_serviceendpoint_servicefabric.serviceendpoint_servicefabrics : k => v.authorization }
}
output "serviceendpoint_servicefabrics_azure_active_directory" {
  description = "Map of azure_active_directory values across all serviceendpoint_servicefabrics, keyed the same as var.serviceendpoint_servicefabrics"
  value       = { for k, v in azuredevops_serviceendpoint_servicefabric.serviceendpoint_servicefabrics : k => one(v.azure_active_directory) }
  sensitive   = true
}
output "serviceendpoint_servicefabrics_certificate" {
  description = "Map of certificate values across all serviceendpoint_servicefabrics, keyed the same as var.serviceendpoint_servicefabrics"
  value       = { for k, v in azuredevops_serviceendpoint_servicefabric.serviceendpoint_servicefabrics : k => one(v.certificate) }
  sensitive   = true
}
output "serviceendpoint_servicefabrics_cluster_endpoint" {
  description = "Map of cluster_endpoint values across all serviceendpoint_servicefabrics, keyed the same as var.serviceendpoint_servicefabrics"
  value       = { for k, v in azuredevops_serviceendpoint_servicefabric.serviceendpoint_servicefabrics : k => v.cluster_endpoint }
}
output "serviceendpoint_servicefabrics_description" {
  description = "Map of description values across all serviceendpoint_servicefabrics, keyed the same as var.serviceendpoint_servicefabrics"
  value       = { for k, v in azuredevops_serviceendpoint_servicefabric.serviceendpoint_servicefabrics : k => v.description }
}
output "serviceendpoint_servicefabrics_none" {
  description = "Map of none values across all serviceendpoint_servicefabrics, keyed the same as var.serviceendpoint_servicefabrics"
  value       = { for k, v in azuredevops_serviceendpoint_servicefabric.serviceendpoint_servicefabrics : k => one(v.none) }
}
output "serviceendpoint_servicefabrics_project_id" {
  description = "Map of project_id values across all serviceendpoint_servicefabrics, keyed the same as var.serviceendpoint_servicefabrics"
  value       = { for k, v in azuredevops_serviceendpoint_servicefabric.serviceendpoint_servicefabrics : k => v.project_id }
}
output "serviceendpoint_servicefabrics_service_endpoint_name" {
  description = "Map of service_endpoint_name values across all serviceendpoint_servicefabrics, keyed the same as var.serviceendpoint_servicefabrics"
  value       = { for k, v in azuredevops_serviceendpoint_servicefabric.serviceendpoint_servicefabrics : k => v.service_endpoint_name }
}

