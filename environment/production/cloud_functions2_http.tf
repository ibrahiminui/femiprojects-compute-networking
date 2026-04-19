module "cloud_function" {
  source = "../../modules/cloud-function-terraform-module/modules/cloud_function"

  project_id     = var.project_id
  region         = var.region
  function_name  = var.function_name
  source_dir     = var.source_dir
  bucket_name    = var.bucket_name
  invoker_member = var.invoker_member
  labels         = var.labels

  # Optional overrides
  description                  = "HTTP Cloud Function for SI-10 input validation"
  runtime                      = "python311"
  entry_point                  = "validate_input"
  service_account_id           = "cf-si10-sa"
  service_account_display_name = "Cloud Function SI-10 Service Account"
  available_memory             = "256M"
  timeout_seconds              = 60
  max_instance_count           = 2
  min_instance_count           = 0
  ingress_settings             = "ALLOW_INTERNAL_AND_GCLB"
}


output "function_name" {
  value = module.cloud_function.function_name
}

output "function_uri" {
  value = module.cloud_function.function_uri
}

output "runtime_service_account_email" {
  value = module.cloud_function.runtime_service_account_email
}

output "source_bucket_name" {
  value = module.cloud_function.source_bucket_name
}


variable "function_name" {
  description = "Name of the Cloud Function"
  type        = string
  default     = "si10-input-validation"
}

variable "source_dir" {
  description = "Path to the local source code folder containing main.py and requirements.txt"
  type        = string
  default     = "../modules/cloud-function-terraform-module/function_source"
}

variable "bucket_name" {
  description = "Bucket name for the function source archive"
  type        = string
}

variable "invoker_member" {
  description = "Principal to grant invoke access to"
  type        = string
}

variable "labels" {
  description = "Common labels"
  type        = map(string)
  default = {
    app = "si10-validation"
    env = "dev"
  }
}

