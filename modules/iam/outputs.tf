output "compute_service_account_email" {
  description = "Email of the compute engine service account"
  value       = google_service_account.this["compute_engine"].email
}

output "service_account_emails" {
  description = "Map of service account emails"
  value       = { for key, sa in google_service_account.this : key => sa.email }
}