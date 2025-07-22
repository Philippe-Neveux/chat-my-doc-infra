output "load_balancer_ip" {
  description = "The IP address of the load balancer for browser access"
  value       = google_compute_global_address.default.address
}

output "browser_access_url" {
  description = "URL for authenticated browser access"
  value       = "https://${google_compute_global_address.default.address}.nip.io"
}