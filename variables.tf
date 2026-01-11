variable "traffic_manager_profiles" {
  description = <<EOT
Map of traffic_manager_profiles, attributes below
Required:
    - name
    - resource_group_name
    - traffic_routing_method
    - dns_config (block):
        - relative_name (required)
        - ttl (required)
    - monitor_config (block):
        - custom_header (optional, block):
            - name (required)
            - value (required)
        - expected_status_code_ranges (optional)
        - interval_in_seconds (optional)
        - path (optional)
        - port (required)
        - protocol (required)
        - timeout_in_seconds (optional)
        - tolerated_number_of_failures (optional)
Optional:
    - max_return
    - profile_status
    - tags
    - traffic_view_enabled
EOT

  type = map(object({
    name                   = string
    resource_group_name    = string
    traffic_routing_method = string
    max_return             = optional(number)
    profile_status         = optional(string, "Enabled")
    tags                   = optional(map(string))
    traffic_view_enabled   = optional(bool)
    dns_config = object({
      relative_name = string
      ttl           = number
    })
    monitor_config = object({
      custom_header = optional(object({
        name  = string
        value = string
      }))
      expected_status_code_ranges  = optional(list(string))
      interval_in_seconds          = optional(number, 30)
      path                         = optional(string)
      port                         = number
      protocol                     = string
      timeout_in_seconds           = optional(number, 10)
      tolerated_number_of_failures = optional(number, 3)
    })
  }))
}

