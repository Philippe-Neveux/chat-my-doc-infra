# Outputs
output "cloud_run_url" {
  description = "Original Cloud Run service URL (requires authentication)"
  value       = "https://llm-gateway-270152570885.australia-southeast1.run.app"
}

output "browser_access_url" {
  description = "Load balancer URL for browser access with IAP"
  value       = module.cloud_run.browser_access_url
}

output "load_balancer_ip" {
  description = "Load balancer IP address"
  value       = module.cloud_run.load_balancer_ip
}
