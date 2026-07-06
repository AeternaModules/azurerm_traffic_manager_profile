output "traffic_manager_profiles" {
  description = "All traffic_manager_profile resources"
  value       = azurerm_traffic_manager_profile.traffic_manager_profiles
}
output "traffic_manager_profiles_dns_config" {
  description = "List of dns_config values across all traffic_manager_profiles"
  value       = [for k, v in azurerm_traffic_manager_profile.traffic_manager_profiles : v.dns_config]
}
output "traffic_manager_profiles_fqdn" {
  description = "List of fqdn values across all traffic_manager_profiles"
  value       = [for k, v in azurerm_traffic_manager_profile.traffic_manager_profiles : v.fqdn]
}
output "traffic_manager_profiles_max_return" {
  description = "List of max_return values across all traffic_manager_profiles"
  value       = [for k, v in azurerm_traffic_manager_profile.traffic_manager_profiles : v.max_return]
}
output "traffic_manager_profiles_monitor_config" {
  description = "List of monitor_config values across all traffic_manager_profiles"
  value       = [for k, v in azurerm_traffic_manager_profile.traffic_manager_profiles : v.monitor_config]
}
output "traffic_manager_profiles_name" {
  description = "List of name values across all traffic_manager_profiles"
  value       = [for k, v in azurerm_traffic_manager_profile.traffic_manager_profiles : v.name]
}
output "traffic_manager_profiles_profile_status" {
  description = "List of profile_status values across all traffic_manager_profiles"
  value       = [for k, v in azurerm_traffic_manager_profile.traffic_manager_profiles : v.profile_status]
}
output "traffic_manager_profiles_resource_group_name" {
  description = "List of resource_group_name values across all traffic_manager_profiles"
  value       = [for k, v in azurerm_traffic_manager_profile.traffic_manager_profiles : v.resource_group_name]
}
output "traffic_manager_profiles_tags" {
  description = "List of tags values across all traffic_manager_profiles"
  value       = [for k, v in azurerm_traffic_manager_profile.traffic_manager_profiles : v.tags]
}
output "traffic_manager_profiles_traffic_routing_method" {
  description = "List of traffic_routing_method values across all traffic_manager_profiles"
  value       = [for k, v in azurerm_traffic_manager_profile.traffic_manager_profiles : v.traffic_routing_method]
}
output "traffic_manager_profiles_traffic_view_enabled" {
  description = "List of traffic_view_enabled values across all traffic_manager_profiles"
  value       = [for k, v in azurerm_traffic_manager_profile.traffic_manager_profiles : v.traffic_view_enabled]
}

