
module "us-west2-gke-cluster" {
  source                = "../../modules/gke-cluster"
  cluster-name          = "us-west2-gke-cluster"
  gke-project           = "global-web-server-473500"
  region                = "us-west2"
  shared-vpc-subnetwork = "projects/global-shared-networking/regions/us-west2/subnetworks/gke-us-west2-subnet"
  shared-vpc-network    = "projects/global-shared-networking/global/networks/compute-us-west2-network"
}

resource "google_container_node_pool" "us-west2-gke-node-pool" {
  name       = "us-west2-gke-node-pool"
  location   = var.region
  cluster    = module.us-west2-gke-cluster.gke-cluster-name
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