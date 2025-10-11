
resource "google_container_node_pool" "us-west2-gke-node-pool" {
  name       = "us-west2-gke-node-pool"
  location   = var.region
  cluster    = google_container_cluster.us-west2-gke-cluster.name
  node_count = 1
  project    = var.gke-project

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = "78332344851-compute@developer.gserviceaccount.com"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    disk_size_gb = "20"
  }
}