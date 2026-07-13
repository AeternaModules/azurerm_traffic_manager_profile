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
    profile_status         = optional(string)
    tags                   = optional(map(string))
    traffic_view_enabled   = optional(bool)
    dns_config = object({
      relative_name = string
      ttl           = number
    })
    monitor_config = object({
      custom_header = optional(list(object({
        name  = string
        value = string
      })))
      expected_status_code_ranges  = optional(list(string))
      interval_in_seconds          = optional(number)
      path                         = optional(string)
      port                         = number
      protocol                     = string
      timeout_in_seconds           = optional(number)
      tolerated_number_of_failures = optional(number)
    })
  }))
  validation {
    condition = alltrue([
      for k, v in var.traffic_manager_profiles : (
        length(v.name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.traffic_manager_profiles : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.traffic_manager_profiles : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.traffic_manager_profiles : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.traffic_manager_profiles : (
        v.monitor_config.custom_header == null || alltrue([for item in v.monitor_config.custom_header : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.traffic_manager_profiles : (
        v.monitor_config.port >= 1 && v.monitor_config.port <= 65535
      )
    ])
    error_message = "must be between 1 and 65535"
  }
  validation {
    condition = alltrue([
      for k, v in var.traffic_manager_profiles : (
        v.monitor_config.interval_in_seconds == null || (contains([10, 30], v.monitor_config.interval_in_seconds))
      )
    ])
    error_message = "must be one of: 10, 30"
  }
  validation {
    condition = alltrue([
      for k, v in var.traffic_manager_profiles : (
        v.monitor_config.timeout_in_seconds == null || (v.monitor_config.timeout_in_seconds >= 5 && v.monitor_config.timeout_in_seconds <= 10)
      )
    ])
    error_message = "must be between 5 and 10"
  }
  validation {
    condition = alltrue([
      for k, v in var.traffic_manager_profiles : (
        v.monitor_config.tolerated_number_of_failures == null || (v.monitor_config.tolerated_number_of_failures >= 0 && v.monitor_config.tolerated_number_of_failures <= 9)
      )
    ])
    error_message = "must be between 0 and 9"
  }
  validation {
    condition = alltrue([
      for k, v in var.traffic_manager_profiles : (
        v.max_return == null || (v.max_return >= 1 && v.max_return <= 8)
      )
    ])
    error_message = "must be between 1 and 8"
  }
  validation {
    condition = alltrue([
      for k, v in var.traffic_manager_profiles : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 12 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

