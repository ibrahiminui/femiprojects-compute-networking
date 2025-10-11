variable "network_name" {
  description = "The GCP project you want to manage"
  type        = string
}

variable "project_id" {
  description = "The GCP project you want to manage"
  type        = string
}

variable "gke-project" {
  description = "The GCP project you want to manage"
  default     = "global-web-server-473500"
  type        = string
}

variable "region" {
  type        = string
  description = "Default Google Cloud region"
}

variable "shared-vpc-subnetwork" {
  type        = string
  description = "shared vpc gke network"
  default     = "projects/global-shared-networking/regions/us-west2/subnetworks/gke-us-west2-subnet"
}

variable "shared-vpc-network" {
  type        = string
  description = "shared vpc gke network"
  default     = "projects/global-shared-networking/global/networks/compute-us-west2-network"
}