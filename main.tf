resource "azurerm_spring_cloud_app" "spring_cloud_apps" {
  for_each = var.spring_cloud_apps

  name                    = each.value.name
  resource_group_name     = each.value.resource_group_name
  service_name            = each.value.service_name
  addon_json              = each.value.addon_json
  https_only              = each.value.https_only
  is_public               = each.value.is_public
  public_endpoint_enabled = each.value.public_endpoint_enabled
  tls_enabled             = each.value.tls_enabled

  dynamic "custom_persistent_disk" {
    for_each = each.value.custom_persistent_disk != null ? [each.value.custom_persistent_disk] : []
    content {
      mount_options     = custom_persistent_disk.value.mount_options
      mount_path        = custom_persistent_disk.value.mount_path
      read_only_enabled = custom_persistent_disk.value.read_only_enabled
      share_name        = custom_persistent_disk.value.share_name
      storage_name      = custom_persistent_disk.value.storage_name
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? [each.value.identity] : []
    content {
      identity_ids = identity.value.identity_ids
      type         = identity.value.type
    }
  }

  dynamic "ingress_settings" {
    for_each = each.value.ingress_settings != null ? [each.value.ingress_settings] : []
    content {
      backend_protocol        = ingress_settings.value.backend_protocol
      read_timeout_in_seconds = ingress_settings.value.read_timeout_in_seconds
      send_timeout_in_seconds = ingress_settings.value.send_timeout_in_seconds
      session_affinity        = ingress_settings.value.session_affinity
      session_cookie_max_age  = ingress_settings.value.session_cookie_max_age
    }
  }

  dynamic "persistent_disk" {
    for_each = each.value.persistent_disk != null ? [each.value.persistent_disk] : []
    content {
      mount_path = persistent_disk.value.mount_path
      size_in_gb = persistent_disk.value.size_in_gb
    }
  }
}

