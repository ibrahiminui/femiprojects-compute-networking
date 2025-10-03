

resource "google_compute_network" "compute_network" {
  name    = var.network_name
  project = var.project_id

  auto_create_subnetworks = false
}



resource "google_compute_subnetwork" "compute_subnet" {
  provider = google-beta

  project = var.project_id
  network = google_compute_network.compute_network.name

  name          = "compute-us-west2-subnet"
  ip_cidr_range = "10.0.2.0/24"
  region        = var.region

  private_ip_google_access = true

}
/*
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