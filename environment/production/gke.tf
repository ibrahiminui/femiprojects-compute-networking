
resource "google_container_cluster" "us-west2-gke-cluster" {
  name     = "us-west2-gke-cluster"
  location = var.region
  project  = var.gke-project

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
  networking_mode          = "VPC_NATIVE"
  network                  = google_compute_network.compute_network.name
  subnetwork               = google_compute_subnetwork.gke_subnet.name

  ip_allocation_policy {
    cluster_secondary_range_name  = "gke-us-west2-subnet-pods"
    services_secondary_range_name = "gke-us-west2-subnet-services"
  }
}

resource "google_container_node_pool" "us-west2-gke-node-pool" {
  name       = "us-west2-gke-node-pool"
  location   = "location = var.region"
  cluster    = google_container_cluster.us-west2-gke-cluster.name
  node_count = 1
  project    = var.gke-project

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = "186235692750-compute@developer.gserviceaccount.com"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    disk_size_gb = "20"
  }
}