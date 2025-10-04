
# -----------------------------
# Instance Template
# -----------------------------
resource "google_compute_instance_template" "webserver-instance-template" {
  name         = "global-webserver-instance-template"
  machine_type = "e2-medium"
  region       = "us-west2"
  project      = var.gke-project

  disk {
    source_image = "projects/debian-cloud/global/images/family/debian-12"
    auto_delete  = true
    boot         = true
  }

  network_interface {
    subnetwork         = "compute-us-west2-subnet"
    subnetwork_project = "global-shared-networking"


    # Assign an ephemeral external IP so instances can pull packages, etc.
    access_config {}
  }

  metadata = {
    startup-script = <<-EOT
        #!/bin/bash
        # Install gsutil if not present (Ubuntu usually has it via google-cloud-sdk)
        apt-get update -y
        apt-get install -y google-cloud-sdk

        # Make a workdir
        mkdir -p /opt/websetup
        cd /opt/websetup

        # Copy script from your bucket
        gsutil cp gs://webserver-app/setup-web.sh .

        # Make executable
        chmod +x setup-web.sh

        # Run it
        ./setup-web.sh
    EOT
  }

  # (Optional) service account scopes
  service_account {
    email  = "78332344851-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}


# -----------------------------
# Regional Managed Instance Group
# -----------------------------
resource "google_compute_region_instance_group_manager" "webserver-us-west2-mig" {
  name               = "webserver-mig-us-west2"
  region             = "us-west2"
  project            = var.gke-project
  base_instance_name = "webserver-mig-us-west2"
  version {
    instance_template = google_compute_instance_template.webserver-instance-template.self_link
    name              = "primary"
  }

  # Start with 3; autoscaler will manage between 3 and 5
  target_size = 3

  # Named port so the backend service can reference "http"
  named_port {
    name = "http"
    port = 80
  }

  # Optionally pin zones. If omitted, GCE can spread across region zones.
  # distribution_policy_zones = [
  #   "us-west2-a",
  #   "us-west2-b",
  #   "us-west2-c"
  # ]
}

# Autoscaling: min 3, max 5
resource "google_compute_region_autoscaler" "autoscaler-uswest2" {
  name    = "webserver-us-west2-autoscaler"
  region  = "us-west2"
  project = var.gke-project
  target  = google_compute_region_instance_group_manager.webserver-us-west2-mig.id

  autoscaling_policy {
    min_replicas = 3
    max_replicas = 5

    # Simple CPU target (optional tune)
    cpu_utilization {
      target = 0.6
    }
    cooldown_period = 60
  }
}
