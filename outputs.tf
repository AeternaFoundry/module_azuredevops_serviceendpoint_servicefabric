output "serviceendpoint_servicefabrics_id" {
  description = "Map of id values across all serviceendpoint_servicefabrics, keyed the same as var.serviceendpoint_servicefabrics except keys with no id are omitted"
  value       = { for k, v in azuredevops_serviceendpoint_servicefabric.serviceendpoint_servicefabrics : k => v.id if v.id != null && length(v.id) > 0 }
}
output "serviceendpoint_servicefabrics_authorization" {
  description = "Map of authorization values across all serviceendpoint_servicefabrics, keyed the same as var.serviceendpoint_servicefabrics except keys with no authorization are omitted"
  value       = { for k, v in azuredevops_serviceendpoint_servicefabric.serviceendpoint_servicefabrics : k => v.authorization if v.authorization != null && length(v.authorization) > 0 }
}
output "serviceendpoint_servicefabrics_azure_active_directory" {
  description = "Map of azure_active_directory values across all serviceendpoint_servicefabrics, keyed the same as var.serviceendpoint_servicefabrics except keys with no azure_active_directory are omitted"
  value       = { for k, v in azuredevops_serviceendpoint_servicefabric.serviceendpoint_servicefabrics : k => one(v.azure_active_directory) if v.azure_active_directory != null && length(v.azure_active_directory) > 0 }
  sensitive   = true
}
output "serviceendpoint_servicefabrics_certificate" {
  description = "Map of certificate values across all serviceendpoint_servicefabrics, keyed the same as var.serviceendpoint_servicefabrics except keys with no certificate are omitted"
  value       = { for k, v in azuredevops_serviceendpoint_servicefabric.serviceendpoint_servicefabrics : k => one(v.certificate) if v.certificate != null && length(v.certificate) > 0 }
  sensitive   = true
}
output "serviceendpoint_servicefabrics_cluster_endpoint" {
  description = "Map of cluster_endpoint values across all serviceendpoint_servicefabrics, keyed the same as var.serviceendpoint_servicefabrics except keys with no cluster_endpoint are omitted"
  value       = { for k, v in azuredevops_serviceendpoint_servicefabric.serviceendpoint_servicefabrics : k => v.cluster_endpoint if v.cluster_endpoint != null && length(v.cluster_endpoint) > 0 }
}
output "serviceendpoint_servicefabrics_description" {
  description = "Map of description values across all serviceendpoint_servicefabrics, keyed the same as var.serviceendpoint_servicefabrics except keys with no description are omitted"
  value       = { for k, v in azuredevops_serviceendpoint_servicefabric.serviceendpoint_servicefabrics : k => v.description if v.description != null && length(v.description) > 0 }
}
output "serviceendpoint_servicefabrics_none" {
  description = "Map of none values across all serviceendpoint_servicefabrics, keyed the same as var.serviceendpoint_servicefabrics except keys with no none are omitted"
  value       = { for k, v in azuredevops_serviceendpoint_servicefabric.serviceendpoint_servicefabrics : k => one(v.none) if v.none != null && length(v.none) > 0 }
}
output "serviceendpoint_servicefabrics_project_id" {
  description = "Map of project_id values across all serviceendpoint_servicefabrics, keyed the same as var.serviceendpoint_servicefabrics except keys with no project_id are omitted"
  value       = { for k, v in azuredevops_serviceendpoint_servicefabric.serviceendpoint_servicefabrics : k => v.project_id if v.project_id != null && length(v.project_id) > 0 }
}
output "serviceendpoint_servicefabrics_service_endpoint_name" {
  description = "Map of service_endpoint_name values across all serviceendpoint_servicefabrics, keyed the same as var.serviceendpoint_servicefabrics except keys with no service_endpoint_name are omitted"
  value       = { for k, v in azuredevops_serviceendpoint_servicefabric.serviceendpoint_servicefabrics : k => v.service_endpoint_name if v.service_endpoint_name != null && length(v.service_endpoint_name) > 0 }
}

