resource "google_compute_network" "this" {
  name    = var.network_name
  project = var.project_id

  auto_create_subnetworks = false
}

/*

resource "google_compute_subnetwork" "this" {
  provider = google-beta

  project = var.project_id
  network = var.network_name

  name          = each.key
  ip_cidr_range = each.value.subnet_ip
  region        = each.value.subnet_region

  private_ip_google_access = each.value.subnet_private_access

  dynamic "log_config" {
    for_each = lookup(each.value, "subnet_flow_logs", false) ? [{
      aggregation_interval = lookup(each.value, "subnet_flow_logs_interval", "INTERVAL_15_MIN")
      flow_sampling        = lookup(each.value, "subnet_flow_logs_sampling", "0.1")
      metadata             = lookup(each.value, "subnet_flow_logs_metadata", "EXCLUDE_ALL_METADATA")
    }] : []
    content {
      aggregation_interval = log_config.value.aggregation_interval
      flow_sampling        = log_config.value.flow_sampling
      metadata             = log_config.value.metadata
    }
  }

  dynamic "secondary_ip_range" {
    for_each = each.value.secondary_ranges
    iterator = range

    content {
      range_name    = range.key
      ip_cidr_range = range.value
    }
  }
}
*/