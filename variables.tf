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
    https_only              = optional(bool)
    is_public               = optional(bool)
    public_endpoint_enabled = optional(bool)
    tls_enabled             = optional(bool)
    custom_persistent_disk = optional(list(object({
      mount_options     = optional(set(string))
      mount_path        = string
      read_only_enabled = optional(bool)
      share_name        = string
      storage_name      = string
    })))
    identity = optional(object({
      identity_ids = optional(set(string))
      type         = string
    }))
    ingress_settings = optional(object({
      backend_protocol        = optional(string)
      read_timeout_in_seconds = optional(number)
      send_timeout_in_seconds = optional(number)
      session_affinity        = optional(string)
      session_cookie_max_age  = optional(number)
    }))
    persistent_disk = optional(object({
      mount_path = optional(string)
      size_in_gb = number
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_apps : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_apps : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_apps : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_apps : (
        v.addon_json == null || (can(jsondecode(v.addon_json)))
      )
    ])
    error_message = "must be valid JSON"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_apps : (
        v.custom_persistent_disk == null || alltrue([for item in v.custom_persistent_disk : (length(item.storage_name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_apps : (
        v.custom_persistent_disk == null || alltrue([for item in v.custom_persistent_disk : (length(item.mount_path) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_apps : (
        v.custom_persistent_disk == null || alltrue([for item in v.custom_persistent_disk : (length(item.share_name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_apps : (
        v.custom_persistent_disk == null || alltrue([for item in v.custom_persistent_disk : (item.mount_options == null || (alltrue([for x in item.mount_options : length(x) > 0])))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_apps : (
        v.ingress_settings == null || (v.ingress_settings.read_timeout_in_seconds == null || (v.ingress_settings.read_timeout_in_seconds >= 0))
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_apps : (
        v.ingress_settings == null || (v.ingress_settings.send_timeout_in_seconds == null || (v.ingress_settings.send_timeout_in_seconds >= 0))
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_apps : (
        v.ingress_settings == null || (v.ingress_settings.session_cookie_max_age == null || (v.ingress_settings.session_cookie_max_age >= 0))
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_apps : (
        v.persistent_disk == null || (v.persistent_disk.size_in_gb >= 0 && v.persistent_disk.size_in_gb <= 50)
      )
    ])
    error_message = "must be between 0 and 50"
  }
  # Note: 13 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

