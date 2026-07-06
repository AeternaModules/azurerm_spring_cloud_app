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
    https_only              = optional(bool) # Default: false
    is_public               = optional(bool) # Default: false
    public_endpoint_enabled = optional(bool)
    tls_enabled             = optional(bool) # Default: false
    custom_persistent_disk = optional(list(object({
      mount_options     = optional(set(string))
      mount_path        = string
      read_only_enabled = optional(bool) # Default: false
      share_name        = string
      storage_name      = string
    })))
    identity = optional(object({
      identity_ids = optional(set(string))
      type         = string
    }))
    ingress_settings = optional(object({
      backend_protocol        = optional(string) # Default: "Default"
      read_timeout_in_seconds = optional(number) # Default: 300
      send_timeout_in_seconds = optional(number) # Default: 60
      session_affinity        = optional(string) # Default: "None"
      session_cookie_max_age  = optional(number)
    }))
    persistent_disk = optional(object({
      mount_path = optional(string) # Default: "/persistent"
      size_in_gb = number
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_apps : (
        v.custom_persistent_disk == null || (length(v.custom_persistent_disk) >= 1)
      )
    ])
    error_message = "Each custom_persistent_disk list must contain at least 1 items"
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
  # --- Unconfirmed validation candidates, derived from azurerm_spring_cloud_app's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from validate.SpringCloudAppName] !ok
  # path: name
  #   source:    [from validate.SpringCloudAppName] !regexp.MustCompile(`^([a-z])([a-z\d-]{2,30})([a-z\d])$`).MatchString(v)
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: service_name
  #   source:    [from validate.SpringCloudServiceName] !ok
  # path: service_name
  #   source:    [from validate.SpringCloudServiceName] !regexp.MustCompile(`^([a-z])([a-z\d-]{2,30})([a-z\d])$`).MatchString(v)
  # path: addon_json
  #   source:    validation.StringIsJSON(...) - no translation rule yet, add one
  # path: identity.type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: identity.identity_ids[*]
  #   source:    [from commonids.ValidateUserAssignedIdentityID] !ok
  # path: identity.identity_ids[*]
  #   source:    [from commonids.ValidateUserAssignedIdentityID] err != nil
  # path: custom_persistent_disk.storage_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: custom_persistent_disk.mount_path
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: custom_persistent_disk.share_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: custom_persistent_disk.mount_options[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: ingress_settings.backend_protocol
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: ingress_settings.session_affinity
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: persistent_disk.mount_path
  #   source:    [from validate.MountPath] !ok
  # path: persistent_disk.mount_path
  #   source:    [from validate.MountPath] len(v) < 2 || len(v) > 255
  # path: persistent_disk.mount_path
  #   source:    [from validate.MountPath] !m
}

