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
    profile_status         = optional(string) # Default: "Enabled"
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
      interval_in_seconds          = optional(number) # Default: 30
      path                         = optional(string)
      port                         = number
      protocol                     = string
      timeout_in_seconds           = optional(number) # Default: 10
      tolerated_number_of_failures = optional(number) # Default: 3
    })
  }))
  # --- Unconfirmed validation candidates, derived from azurerm_traffic_manager_profile's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   condition: length(value) > 0
  #   message:   must not be empty
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
  # path: traffic_routing_method
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: dns_config.ttl
  #   source:    validation.IntBetween(0, math.MaxInt32) - bound(s) not a literal int (e.g. a named constant like math.MaxInt32) - resolve manually
  # path: monitor_config.expected_status_code_ranges[*]
  #   source:    [from validate.StatusCodeRange] !ok
  # path: monitor_config.expected_status_code_ranges[*]
  #   condition: length(value) == 2
  #   message:   [from validate.StatusCodeRange: invalid when len(value) != 2]
  #   source:    [from validate.StatusCodeRange: invalid when len(value) != 2]
  # path: monitor_config.expected_status_code_ranges[*]
  #   source:    [from validate.StatusCodeRange] err != nil
  # path: monitor_config.expected_status_code_ranges[*]
  #   source:    [from validate.StatusCodeRange] err != nil
  # path: monitor_config.custom_header.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: monitor_config.protocol
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: monitor_config.port
  #   condition: value >= 1 && value <= 65535
  #   message:   must be between 1 and 65535
  # path: monitor_config.interval_in_seconds
  #   source:    validation.IntInSlice(...) - no translation rule yet, add one
  # path: monitor_config.timeout_in_seconds
  #   condition: value >= 5 && value <= 10
  #   message:   must be between 5 and 10
  # path: monitor_config.tolerated_number_of_failures
  #   condition: value >= 0 && value <= 9
  #   message:   must be between 0 and 9
  # path: profile_status
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: max_return
  #   condition: value >= 1 && value <= 8
  #   message:   must be between 1 and 8
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

