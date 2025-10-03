

resource "google_compute_router" "global-shared-router-prod-us-west2" {
  name    = "global-shared-router-prod-us-west2"
  project = var.project_id
  region  = var.region
  network = google_compute_network.compute_network.name
}


resource "google_compute_router_nat" "global-shared-prod-nat-gateway-us-west2" {
  name    = "global-shared-prod-nat-gateway-us-west2"
  project = var.project_id
  router  = google_compute_router.global-shared-router-prod-us-west2.name
  region  = var.region

  nat_ip_allocate_option = "AUTO_ONLY"

  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}