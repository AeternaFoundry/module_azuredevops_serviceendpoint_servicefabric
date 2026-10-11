variable "serviceendpoint_servicefabrics" {
  description = <<EOT
Map of serviceendpoint_servicefabrics, attributes below
Required:
    - cluster_endpoint
    - project_id
    - service_endpoint_name
Optional:
    - description
    - azure_active_directory (block):
        - password (required)
        - server_certificate_common_name (optional)
        - server_certificate_lookup (required)
        - server_certificate_thumbprint (optional)
        - username (required)
    - certificate (block):
        - client_certificate (required)
        - client_certificate_password (optional)
        - server_certificate_common_name (optional)
        - server_certificate_lookup (required)
        - server_certificate_thumbprint (optional)
    - none (block):
        - cluster_spn (optional)
        - unsecured (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - read (optional)
        - update (optional)
EOT

  type = map(object({
    cluster_endpoint      = string
    project_id            = string
    service_endpoint_name = string
    description           = optional(string)
    azure_active_directory = optional(object({
      password                       = string
      server_certificate_common_name = optional(string)
      server_certificate_lookup      = string
      server_certificate_thumbprint  = optional(string)
      username                       = string
    }))
    certificate = optional(object({
      client_certificate             = string
      client_certificate_password    = optional(string)
      server_certificate_common_name = optional(string)
      server_certificate_lookup      = string
      server_certificate_thumbprint  = optional(string)
    }))
    none = optional(object({
      cluster_spn = optional(string)
      unsecured   = optional(bool)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.serviceendpoint_servicefabrics : (
        v.certificate == null || (contains(["Thumbprint", "CommonName"], v.certificate.server_certificate_lookup))
      )
    ])
    error_message = "must be one of: \"Thumbprint\", \"CommonName\""
  }
  validation {
    condition = alltrue([
      for k, v in var.serviceendpoint_servicefabrics : (
        v.certificate == null || (v.certificate.server_certificate_thumbprint == null || (length(v.certificate.server_certificate_thumbprint) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.serviceendpoint_servicefabrics : (
        v.certificate == null || (v.certificate.server_certificate_common_name == null || (length(v.certificate.server_certificate_common_name) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.serviceendpoint_servicefabrics : (
        v.certificate == null || (length(v.certificate.client_certificate) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.serviceendpoint_servicefabrics : (
        v.certificate == null || (v.certificate.client_certificate_password == null || (length(v.certificate.client_certificate_password) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.serviceendpoint_servicefabrics : (
        v.azure_active_directory == null || (contains(["Thumbprint", "CommonName"], v.azure_active_directory.server_certificate_lookup))
      )
    ])
    error_message = "must be one of: \"Thumbprint\", \"CommonName\""
  }
  validation {
    condition = alltrue([
      for k, v in var.serviceendpoint_servicefabrics : (
        v.azure_active_directory == null || (v.azure_active_directory.server_certificate_thumbprint == null || (length(v.azure_active_directory.server_certificate_thumbprint) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.serviceendpoint_servicefabrics : (
        v.azure_active_directory == null || (v.azure_active_directory.server_certificate_common_name == null || (length(v.azure_active_directory.server_certificate_common_name) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.serviceendpoint_servicefabrics : (
        v.azure_active_directory == null || (length(v.azure_active_directory.username) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.serviceendpoint_servicefabrics : (
        v.azure_active_directory == null || (length(v.azure_active_directory.password) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.serviceendpoint_servicefabrics : (
        v.none == null || (v.none.cluster_spn == null || (length(v.none.cluster_spn) >= 0 && length(v.none.cluster_spn) <= 1024))
      )
    ])
    error_message = "must be between 0 and 1024 characters"
  }
}

