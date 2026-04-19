variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "function_name" {
  description = "Name of the Cloud Function"
  type        = string
}

variable "description" {
  description = "Description of the Cloud Function"
  type        = string
  default     = "HTTP Cloud Function for SI-10 input validation"
}

variable "runtime" {
  description = "Runtime for the Cloud Function"
  type        = string
  default     = "python311"
}

variable "entry_point" {
  description = "Python function entry point"
  type        = string
  default     = "validate_input"
}

variable "source_dir" {
  description = "Local directory containing main.py and requirements.txt"
  type        = string
}

variable "bucket_name" {
  description = "Bucket name for function source archive"
  type        = string
}

variable "service_account_id" {
  description = "Service account ID for the function runtime"
  type        = string
  default     = "cf-si10-sa"
}

variable "service_account_display_name" {
  description = "Display name for the function runtime service account"
  type        = string
  default     = "Cloud Function SI-10 Service Account"
}

variable "available_memory" {
  description = "Memory available to the function"
  type        = string
  default     = "256M"
}

variable "timeout_seconds" {
  description = "Function timeout in seconds"
  type        = number
  default     = 60
}

variable "max_instance_count" {
  description = "Maximum number of function instances"
  type        = number
  default     = 2
}

variable "min_instance_count" {
  description = "Minimum number of function instances"
  type        = number
  default     = 0
}

variable "ingress_settings" {
  description = "Ingress settings for the function"
  type        = string
  default     = "ALLOW_ALL"
}

variable "invoker_member" {
  description = "Principal to grant invoke access to, e.g. user:you@example.com or serviceAccount:name@project.iam.gserviceaccount.com"
  type        = string
}

variable "labels" {
  description = "Labels to apply to resources where supported"
  type        = map(string)
  default     = {}
}

variable "vpc_network" {
  description = "VPC network name or self_link for Direct VPC egress"
  type        = string
}

variable "vpc_subnetwork" {
  description = "Subnetwork name or self_link for Direct VPC egress"
  type        = string
}

variable "direct_vpc_egress" {
  description = "Direct VPC egress mode"
  type        = string
  default     = "VPC_EGRESS_PRIVATE_RANGES_ONLY"
}