# A host project provides network resources to associated service projects.
resource "google_compute_shared_vpc_host_project" "shared-vpc-host" {
  project = var.project_id
}

# A service project gains access to network resources provided by its
# associated host project.
resource "google_compute_shared_vpc_service_project" "shared-service-" {
  host_project    = google_compute_shared_vpc_host_project.shared-vpc-host.project
  service_project = "global-web-server-473500"
}
