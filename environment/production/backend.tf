terraform {
  backend "gcs" {
    bucket = "org-tf-state-file-femiprojects"
    prefix = "state/femiprojects-compute-networking/production"
  }
}