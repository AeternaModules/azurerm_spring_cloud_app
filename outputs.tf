output "spring_cloud_apps_id" {
  description = "Map of id values across all spring_cloud_apps, keyed the same as var.spring_cloud_apps"
  value       = { for k, v in azurerm_spring_cloud_app.spring_cloud_apps : k => v.id if v.id != null && length(v.id) > 0 }
}
output "spring_cloud_apps_addon_json" {
  description = "Map of addon_json values across all spring_cloud_apps, keyed the same as var.spring_cloud_apps"
  value       = { for k, v in azurerm_spring_cloud_app.spring_cloud_apps : k => v.addon_json if v.addon_json != null && length(v.addon_json) > 0 }
}
output "spring_cloud_apps_custom_persistent_disk" {
  description = "Map of custom_persistent_disk values across all spring_cloud_apps, keyed the same as var.spring_cloud_apps"
  value       = { for k, v in azurerm_spring_cloud_app.spring_cloud_apps : k => v.custom_persistent_disk if v.custom_persistent_disk != null && length(v.custom_persistent_disk) > 0 }
}
output "spring_cloud_apps_fqdn" {
  description = "Map of fqdn values across all spring_cloud_apps, keyed the same as var.spring_cloud_apps"
  value       = { for k, v in azurerm_spring_cloud_app.spring_cloud_apps : k => v.fqdn if v.fqdn != null && length(v.fqdn) > 0 }
}
output "spring_cloud_apps_https_only" {
  description = "Map of https_only values across all spring_cloud_apps, keyed the same as var.spring_cloud_apps"
  value       = { for k, v in azurerm_spring_cloud_app.spring_cloud_apps : k => v.https_only if v.https_only != null }
}
output "spring_cloud_apps_identity" {
  description = "Map of identity values across all spring_cloud_apps, keyed the same as var.spring_cloud_apps"
  value       = { for k, v in azurerm_spring_cloud_app.spring_cloud_apps : k => v.identity if v.identity != null && length(v.identity) > 0 }
}
output "spring_cloud_apps_ingress_settings" {
  description = "Map of ingress_settings values across all spring_cloud_apps, keyed the same as var.spring_cloud_apps"
  value       = { for k, v in azurerm_spring_cloud_app.spring_cloud_apps : k => v.ingress_settings if v.ingress_settings != null && length(v.ingress_settings) > 0 }
}
output "spring_cloud_apps_is_public" {
  description = "Map of is_public values across all spring_cloud_apps, keyed the same as var.spring_cloud_apps"
  value       = { for k, v in azurerm_spring_cloud_app.spring_cloud_apps : k => v.is_public if v.is_public != null }
}
output "spring_cloud_apps_name" {
  description = "Map of name values across all spring_cloud_apps, keyed the same as var.spring_cloud_apps"
  value       = { for k, v in azurerm_spring_cloud_app.spring_cloud_apps : k => v.name if v.name != null && length(v.name) > 0 }
}
output "spring_cloud_apps_persistent_disk" {
  description = "Map of persistent_disk values across all spring_cloud_apps, keyed the same as var.spring_cloud_apps"
  value       = { for k, v in azurerm_spring_cloud_app.spring_cloud_apps : k => v.persistent_disk if v.persistent_disk != null && length(v.persistent_disk) > 0 }
}
output "spring_cloud_apps_public_endpoint_enabled" {
  description = "Map of public_endpoint_enabled values across all spring_cloud_apps, keyed the same as var.spring_cloud_apps"
  value       = { for k, v in azurerm_spring_cloud_app.spring_cloud_apps : k => v.public_endpoint_enabled if v.public_endpoint_enabled != null }
}
output "spring_cloud_apps_resource_group_name" {
  description = "Map of resource_group_name values across all spring_cloud_apps, keyed the same as var.spring_cloud_apps"
  value       = { for k, v in azurerm_spring_cloud_app.spring_cloud_apps : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "spring_cloud_apps_service_name" {
  description = "Map of service_name values across all spring_cloud_apps, keyed the same as var.spring_cloud_apps"
  value       = { for k, v in azurerm_spring_cloud_app.spring_cloud_apps : k => v.service_name if v.service_name != null && length(v.service_name) > 0 }
}
output "spring_cloud_apps_tls_enabled" {
  description = "Map of tls_enabled values across all spring_cloud_apps, keyed the same as var.spring_cloud_apps"
  value       = { for k, v in azurerm_spring_cloud_app.spring_cloud_apps : k => v.tls_enabled if v.tls_enabled != null }
}
output "spring_cloud_apps_url" {
  description = "Map of url values across all spring_cloud_apps, keyed the same as var.spring_cloud_apps"
  value       = { for k, v in azurerm_spring_cloud_app.spring_cloud_apps : k => v.url if v.url != null && length(v.url) > 0 }
}

