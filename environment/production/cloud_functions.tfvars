project_id     = "org-governance-project-femi"
region         = "us-central1"
function_name  = "si10-input-validation"
source_dir     = "../../modules/cloud-function-terraform-module/function_source"
bucket_name    = "org-governance-project-femi-si10-source"
invoker_member = "user:admin@femicloudprojects.com"

labels = {
  app = "si10-validation"
  env = "dev"
}
