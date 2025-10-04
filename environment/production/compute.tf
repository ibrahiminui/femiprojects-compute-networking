
# -----------------------------
# Instance Template
# -----------------------------
resource "google_compute_instance_template" "webserver-instance-template" {
  name         = "global-webserver-instance-template"
  machine_type = "e2-medium"
  region       = "us-west2"

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

