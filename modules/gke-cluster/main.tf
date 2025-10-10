
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
  network                  = var.shared-vpc-network
  subnetwork               = var.shared-vpc-subnetwork
  deletion_protection      = false

  ip_allocation_policy {
    cluster_secondary_range_name  = "gke-us-west2-subnet-pods"
    services_secondary_range_name = "gke-us-west2-subnet-services"
  }
}