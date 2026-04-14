output "function_name" {
  description = "Deployed function name"
  value       = google_cloudfunctions2_function.function.name
}

output "function_uri" {
  description = "HTTPS URI of the function"
  value       = google_cloudfunctions2_function.function.service_config[0].uri
}

output "runtime_service_account_email" {
  description = "Runtime service account email"
  value       = google_service_account.function_sa.email
}

output "source_bucket_name" {
  description = "Bucket storing the function source archive"
  value       = google_storage_bucket.function_source.name
}
