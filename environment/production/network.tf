

resource "google_compute_network" "compute_network" {
  name    = var.network_name
  project = var.project_id

  auto_create_subnetworks = false
}

/*

resource "google_compute_subnetwork" "compute_subnet" {
  provider = google-beta

  project = var.project_id
  network = google_compute_network.compute_network.name

  name          = "compute-us-west2-subnet"
  ip_cidr_range = "10.0.2.0/24"
  region        = var.region

  private_ip_google_access = true

}

resource "google_compute_subnetwork" "gke_subnet" {
  provider = google-beta

  project = var.project_id
  network = google_compute_network.compute_network.name

  name          = "gke-us-west2-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = var.region

  private_ip_google_access = true


  secondary_ip_range {
    range_name    = "gke-us-west2-subnet-pods"
    ip_cidr_range = "10.4.0.0/16"
  }

  secondary_ip_range {
    range_name    = "gke-us-west2-subnet-services"
    ip_cidr_range = "10.5.0.0/20"
  }
}
*/

