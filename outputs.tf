output "spring_cloud_apps" {
  description = "All spring_cloud_app resources"
  value       = azurerm_spring_cloud_app.spring_cloud_apps
}
output "spring_cloud_apps_addon_json" {
  description = "List of addon_json values across all spring_cloud_apps"
  value       = [for k, v in azurerm_spring_cloud_app.spring_cloud_apps : v.addon_json]
}
output "spring_cloud_apps_custom_persistent_disk" {
  description = "List of custom_persistent_disk values across all spring_cloud_apps"
  value       = [for k, v in azurerm_spring_cloud_app.spring_cloud_apps : v.custom_persistent_disk]
}
output "spring_cloud_apps_fqdn" {
  description = "List of fqdn values across all spring_cloud_apps"
  value       = [for k, v in azurerm_spring_cloud_app.spring_cloud_apps : v.fqdn]
}
output "spring_cloud_apps_https_only" {
  description = "List of https_only values across all spring_cloud_apps"
  value       = [for k, v in azurerm_spring_cloud_app.spring_cloud_apps : v.https_only]
}
output "spring_cloud_apps_identity" {
  description = "List of identity values across all spring_cloud_apps"
  value       = [for k, v in azurerm_spring_cloud_app.spring_cloud_apps : v.identity]
}
output "spring_cloud_apps_ingress_settings" {
  description = "List of ingress_settings values across all spring_cloud_apps"
  value       = [for k, v in azurerm_spring_cloud_app.spring_cloud_apps : v.ingress_settings]
}
output "spring_cloud_apps_is_public" {
  description = "List of is_public values across all spring_cloud_apps"
  value       = [for k, v in azurerm_spring_cloud_app.spring_cloud_apps : v.is_public]
}
output "spring_cloud_apps_name" {
  description = "List of name values across all spring_cloud_apps"
  value       = [for k, v in azurerm_spring_cloud_app.spring_cloud_apps : v.name]
}
output "spring_cloud_apps_persistent_disk" {
  description = "List of persistent_disk values across all spring_cloud_apps"
  value       = [for k, v in azurerm_spring_cloud_app.spring_cloud_apps : v.persistent_disk]
}
output "spring_cloud_apps_public_endpoint_enabled" {
  description = "List of public_endpoint_enabled values across all spring_cloud_apps"
  value       = [for k, v in azurerm_spring_cloud_app.spring_cloud_apps : v.public_endpoint_enabled]
}
output "spring_cloud_apps_resource_group_name" {
  description = "List of resource_group_name values across all spring_cloud_apps"
  value       = [for k, v in azurerm_spring_cloud_app.spring_cloud_apps : v.resource_group_name]
}
output "spring_cloud_apps_service_name" {
  description = "List of service_name values across all spring_cloud_apps"
  value       = [for k, v in azurerm_spring_cloud_app.spring_cloud_apps : v.service_name]
}
output "spring_cloud_apps_tls_enabled" {
  description = "List of tls_enabled values across all spring_cloud_apps"
  value       = [for k, v in azurerm_spring_cloud_app.spring_cloud_apps : v.tls_enabled]
}
output "spring_cloud_apps_url" {
  description = "List of url values across all spring_cloud_apps"
  value       = [for k, v in azurerm_spring_cloud_app.spring_cloud_apps : v.url]
}

