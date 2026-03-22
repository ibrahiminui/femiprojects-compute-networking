network_name = "compute-us-west2-network"
## to revisit
##project_id   = "global-shared-networking"
region = "us-west2"



project_id     = "org-governance-project-femi"
function_name  = "si10-input-validation"
source_dir     = "../../modules/cloud-function-terraform-module/function_source"
bucket_name    = "org-governance-project-femi-si10-source"
invoker_member = "user:ibrahiminui@gmail.com"

labels = {
  app = "si10-validation"
  env = "dev"
}