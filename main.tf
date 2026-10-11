resource "azuredevops_serviceendpoint_servicefabric" "serviceendpoint_servicefabrics" {
  for_each = var.serviceendpoint_servicefabrics

  cluster_endpoint      = each.value.cluster_endpoint
  project_id            = each.value.project_id
  service_endpoint_name = each.value.service_endpoint_name
  description           = each.value.description

  dynamic "azure_active_directory" {
    for_each = each.value.azure_active_directory != null ? [each.value.azure_active_directory] : []
    content {
      password                       = azure_active_directory.value.password
      server_certificate_common_name = azure_active_directory.value.server_certificate_common_name
      server_certificate_lookup      = azure_active_directory.value.server_certificate_lookup
      server_certificate_thumbprint  = azure_active_directory.value.server_certificate_thumbprint
      username                       = azure_active_directory.value.username
    }
  }

  dynamic "certificate" {
    for_each = each.value.certificate != null ? [each.value.certificate] : []
    content {
      client_certificate             = certificate.value.client_certificate
      client_certificate_password    = certificate.value.client_certificate_password
      server_certificate_common_name = certificate.value.server_certificate_common_name
      server_certificate_lookup      = certificate.value.server_certificate_lookup
      server_certificate_thumbprint  = certificate.value.server_certificate_thumbprint
    }
  }

  dynamic "none" {
    for_each = each.value.none != null ? [each.value.none] : []
    content {
      cluster_spn = none.value.cluster_spn
      unsecured   = none.value.unsecured
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
      update = timeouts.value.update
    }
  }
}

