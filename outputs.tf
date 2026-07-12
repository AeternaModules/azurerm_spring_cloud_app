output "spring_cloud_apps_id" {
  description = "Map of id values across all spring_cloud_apps, keyed the same as var.spring_cloud_apps"
  value       = { for k, v in azurerm_spring_cloud_app.spring_cloud_apps : k => v.id }
}
output "spring_cloud_apps_addon_json" {
  description = "Map of addon_json values across all spring_cloud_apps, keyed the same as var.spring_cloud_apps"
  value       = { for k, v in azurerm_spring_cloud_app.spring_cloud_apps : k => v.addon_json }
}
output "spring_cloud_apps_custom_persistent_disk" {
  description = "Map of custom_persistent_disk values across all spring_cloud_apps, keyed the same as var.spring_cloud_apps"
  value       = { for k, v in azurerm_spring_cloud_app.spring_cloud_apps : k => v.custom_persistent_disk }
}
output "spring_cloud_apps_fqdn" {
  description = "Map of fqdn values across all spring_cloud_apps, keyed the same as var.spring_cloud_apps"
  value       = { for k, v in azurerm_spring_cloud_app.spring_cloud_apps : k => v.fqdn }
}
output "spring_cloud_apps_https_only" {
  description = "Map of https_only values across all spring_cloud_apps, keyed the same as var.spring_cloud_apps"
  value       = { for k, v in azurerm_spring_cloud_app.spring_cloud_apps : k => v.https_only }
}
output "spring_cloud_apps_identity" {
  description = "Map of identity values across all spring_cloud_apps, keyed the same as var.spring_cloud_apps"
  value       = { for k, v in azurerm_spring_cloud_app.spring_cloud_apps : k => v.identity }
}
output "spring_cloud_apps_ingress_settings" {
  description = "Map of ingress_settings values across all spring_cloud_apps, keyed the same as var.spring_cloud_apps"
  value       = { for k, v in azurerm_spring_cloud_app.spring_cloud_apps : k => v.ingress_settings }
}
output "spring_cloud_apps_is_public" {
  description = "Map of is_public values across all spring_cloud_apps, keyed the same as var.spring_cloud_apps"
  value       = { for k, v in azurerm_spring_cloud_app.spring_cloud_apps : k => v.is_public }
}
output "spring_cloud_apps_name" {
  description = "Map of name values across all spring_cloud_apps, keyed the same as var.spring_cloud_apps"
  value       = { for k, v in azurerm_spring_cloud_app.spring_cloud_apps : k => v.name }
}
output "spring_cloud_apps_persistent_disk" {
  description = "Map of persistent_disk values across all spring_cloud_apps, keyed the same as var.spring_cloud_apps"
  value       = { for k, v in azurerm_spring_cloud_app.spring_cloud_apps : k => v.persistent_disk }
}
output "spring_cloud_apps_public_endpoint_enabled" {
  description = "Map of public_endpoint_enabled values across all spring_cloud_apps, keyed the same as var.spring_cloud_apps"
  value       = { for k, v in azurerm_spring_cloud_app.spring_cloud_apps : k => v.public_endpoint_enabled }
}
output "spring_cloud_apps_resource_group_name" {
  description = "Map of resource_group_name values across all spring_cloud_apps, keyed the same as var.spring_cloud_apps"
  value       = { for k, v in azurerm_spring_cloud_app.spring_cloud_apps : k => v.resource_group_name }
}
output "spring_cloud_apps_service_name" {
  description = "Map of service_name values across all spring_cloud_apps, keyed the same as var.spring_cloud_apps"
  value       = { for k, v in azurerm_spring_cloud_app.spring_cloud_apps : k => v.service_name }
}
output "spring_cloud_apps_tls_enabled" {
  description = "Map of tls_enabled values across all spring_cloud_apps, keyed the same as var.spring_cloud_apps"
  value       = { for k, v in azurerm_spring_cloud_app.spring_cloud_apps : k => v.tls_enabled }
}
output "spring_cloud_apps_url" {
  description = "Map of url values across all spring_cloud_apps, keyed the same as var.spring_cloud_apps"
  value       = { for k, v in azurerm_spring_cloud_app.spring_cloud_apps : k => v.url }
}

