
module "us-west2-gke-cluster" {

  source = "../../modules/gke-cluster"
  region = "us-west2"

}


resource "google_container_node_pool" "us-west2-gke-node-pool" {
  name     = "us-west2-gke-node-pool"
  location = var.region
  cluster  = module.us-west2-gke-cluster.name

}