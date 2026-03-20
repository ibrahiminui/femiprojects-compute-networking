# Cloud Function Terraform Module Example

## Structure

- `modules/cloud_function`: reusable Cloud Function module
- `function_source`: sample Python source for the function
- root files: module caller configuration

## Usage

1. Update `terraform.tfvars`
2. Run:

```bash
terraform init
terraform plan
terraform apply
```

## Notes

- This deploys a 2nd gen Cloud Function using `google_cloudfunctions2_function`
- The function source is zipped and uploaded to GCS automatically
- Invocation is restricted to the `invoker_member` you set in `terraform.tfvars`
