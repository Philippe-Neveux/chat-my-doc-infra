output "bucket_name" {
  description = "The name of the storage bucket"
  value       = google_storage_bucket.main.name
}

output "bucket_url" {
  description = "The base URL of the bucket"
  value       = google_storage_bucket.main.url
}

output "bucket_self_link" {
  description = "The URI of the created resource"
  value       = google_storage_bucket.main.self_link
}