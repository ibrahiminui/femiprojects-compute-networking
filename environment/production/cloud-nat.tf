/**

resource "google_compute_router" "hhc-global-shared-router-prod-us-west2" {
  name    = "hhc-global-shared-router-prod-us-west2"
  project = var.project_id
  region  = "us-west2"
  network = "hhc-shared-prd-vpc"

  bgp {
    advertise_mode = "DEFAULT"
    asn            = 65001
  }
}


resource "google_compute_router_nat" "hhc-global-shared-prod-nat-gateway-us-west2" {
  name    = "hhc-global-shared-prod-nat-gateway-us-west2"
  project = "hhc-global-gke"
  router  = google_compute_router.hhc-global-shared-router-prod-us-west2.name
  region  = "us-west2"

  nat_ip_allocate_option = "AUTO_ONLY"
  min_ports_per_vm       = 32
  max_ports_per_vm       = 65536

  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}
**/