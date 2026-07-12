output "traffic_manager_profiles_dns_config" {
  description = "Map of dns_config values across all traffic_manager_profiles, keyed the same as var.traffic_manager_profiles"
  value       = { for k, v in azurerm_traffic_manager_profile.traffic_manager_profiles : k => v.dns_config }
}
output "traffic_manager_profiles_fqdn" {
  description = "Map of fqdn values across all traffic_manager_profiles, keyed the same as var.traffic_manager_profiles"
  value       = { for k, v in azurerm_traffic_manager_profile.traffic_manager_profiles : k => v.fqdn }
}
output "traffic_manager_profiles_max_return" {
  description = "Map of max_return values across all traffic_manager_profiles, keyed the same as var.traffic_manager_profiles"
  value       = { for k, v in azurerm_traffic_manager_profile.traffic_manager_profiles : k => v.max_return }
}
output "traffic_manager_profiles_monitor_config" {
  description = "Map of monitor_config values across all traffic_manager_profiles, keyed the same as var.traffic_manager_profiles"
  value       = { for k, v in azurerm_traffic_manager_profile.traffic_manager_profiles : k => v.monitor_config }
}
output "traffic_manager_profiles_name" {
  description = "Map of name values across all traffic_manager_profiles, keyed the same as var.traffic_manager_profiles"
  value       = { for k, v in azurerm_traffic_manager_profile.traffic_manager_profiles : k => v.name }
}
output "traffic_manager_profiles_profile_status" {
  description = "Map of profile_status values across all traffic_manager_profiles, keyed the same as var.traffic_manager_profiles"
  value       = { for k, v in azurerm_traffic_manager_profile.traffic_manager_profiles : k => v.profile_status }
}
output "traffic_manager_profiles_resource_group_name" {
  description = "Map of resource_group_name values across all traffic_manager_profiles, keyed the same as var.traffic_manager_profiles"
  value       = { for k, v in azurerm_traffic_manager_profile.traffic_manager_profiles : k => v.resource_group_name }
}
output "traffic_manager_profiles_tags" {
  description = "Map of tags values across all traffic_manager_profiles, keyed the same as var.traffic_manager_profiles"
  value       = { for k, v in azurerm_traffic_manager_profile.traffic_manager_profiles : k => v.tags }
}
output "traffic_manager_profiles_traffic_routing_method" {
  description = "Map of traffic_routing_method values across all traffic_manager_profiles, keyed the same as var.traffic_manager_profiles"
  value       = { for k, v in azurerm_traffic_manager_profile.traffic_manager_profiles : k => v.traffic_routing_method }
}
output "traffic_manager_profiles_traffic_view_enabled" {
  description = "Map of traffic_view_enabled values across all traffic_manager_profiles, keyed the same as var.traffic_manager_profiles"
  value       = { for k, v in azurerm_traffic_manager_profile.traffic_manager_profiles : k => v.traffic_view_enabled }
}

