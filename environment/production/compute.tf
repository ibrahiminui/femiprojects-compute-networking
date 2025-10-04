
# -----------------------------
# Instance Template
# -----------------------------
resource "google_compute_instance_template" "webserver-instance-template" {
  name         = "global-webserver-instance-template"
  machine_type = "e2-medium"

  disk {
    source_image = "projects/debian-cloud/global/images/family/debian-12"
    auto_delete  = true
    boot         = true
  }

  network_interface {
    # Uses default VPC; optionally set subnetwork = "regions/us-west2/subnetworks/default"
    network    = "projects/global-shared-networking/global/networks/compute-us-west2-network"
    subnetwork = "projects/global-shared-networking/regions/us-west2/subnetworks/compute-us-west2-subnet"
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

