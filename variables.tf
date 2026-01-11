variable "spring_cloud_apps" {
  description = <<EOT
Map of spring_cloud_apps, attributes below
Required:
    - name
    - resource_group_name
    - service_name
Optional:
    - addon_json
    - https_only
    - is_public
    - public_endpoint_enabled
    - tls_enabled
    - custom_persistent_disk (block):
        - mount_options (optional)
        - mount_path (required)
        - read_only_enabled (optional)
        - share_name (required)
        - storage_name (required)
    - identity (block):
        - identity_ids (optional)
        - type (required)
    - ingress_settings (block):
        - backend_protocol (optional)
        - read_timeout_in_seconds (optional)
        - send_timeout_in_seconds (optional)
        - session_affinity (optional)
        - session_cookie_max_age (optional)
    - persistent_disk (block):
        - mount_path (optional)
        - size_in_gb (required)
EOT

  type = map(object({
    name                    = string
    resource_group_name     = string
    service_name            = string
    addon_json              = optional(string)
    https_only              = optional(bool, false)
    is_public               = optional(bool, false)
    public_endpoint_enabled = optional(bool)
    tls_enabled             = optional(bool, false)
    custom_persistent_disk = optional(object({
      mount_options     = optional(set(string))
      mount_path        = string
      read_only_enabled = optional(bool, false)
      share_name        = string
      storage_name      = string
    }))
    identity = optional(object({
      identity_ids = optional(set(string))
      type         = string
    }))
    ingress_settings = optional(object({
      backend_protocol        = optional(string, "Default")
      read_timeout_in_seconds = optional(number, 300)
      send_timeout_in_seconds = optional(number, 60)
      session_affinity        = optional(string, "None")
      session_cookie_max_age  = optional(number)
    }))
    persistent_disk = optional(object({
      mount_path = optional(string, "/persistent")
      size_in_gb = number
    }))
  }))
}

