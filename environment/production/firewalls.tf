resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh-access"
  network = google_compute_network.compute_network.name
  project = var.project_id

  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  direction = "INGRESS"
}

resource "google_compute_firewall" "allow-http" {
  name    = "allow-http-traffic"
  network = google_compute_network.compute_network.name
  project = var.project_id

  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  direction = "INGRESS"
}

resource "google_compute_firewall" "google-healthcheck" {
  name    = "allow-google-healthcheck"
  network = google_compute_network.compute_network.name
  project = var.project_id

  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = []
  }

  direction = "INGRESS"

}
