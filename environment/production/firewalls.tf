resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh-access"
  network = google_compute_network.compute_network.name
  project = var.project_id

  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  direction   = "INGRESS"
  source_tags = ["web"]
}
