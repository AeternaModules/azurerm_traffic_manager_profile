resource "azurerm_traffic_manager_profile" "traffic_manager_profiles" {
  for_each = var.traffic_manager_profiles

  name                   = each.value.name
  resource_group_name    = each.value.resource_group_name
  traffic_routing_method = each.value.traffic_routing_method
  max_return             = each.value.max_return
  profile_status         = each.value.profile_status
  tags                   = each.value.tags
  traffic_view_enabled   = each.value.traffic_view_enabled

  dns_config {
    relative_name = each.value.dns_config.relative_name
    ttl           = each.value.dns_config.ttl
  }

  monitor_config {
    dynamic "custom_header" {
      for_each = each.value.monitor_config.custom_header != null ? [each.value.monitor_config.custom_header] : []
      content {
        name  = custom_header.value.name
        value = custom_header.value.value
      }
    }
    expected_status_code_ranges  = each.value.monitor_config.expected_status_code_ranges
    interval_in_seconds          = each.value.monitor_config.interval_in_seconds
    path                         = each.value.monitor_config.path
    port                         = each.value.monitor_config.port
    protocol                     = each.value.monitor_config.protocol
    timeout_in_seconds           = each.value.monitor_config.timeout_in_seconds
    tolerated_number_of_failures = each.value.monitor_config.tolerated_number_of_failures
  }
}

