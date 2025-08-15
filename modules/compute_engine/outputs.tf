output "instance_names" {
  description = "Names of the created GPU instances"
  value       = google_compute_instance.gpu_vm[*].name
}

output "instance_ips" {
  description = "Static external IP addresses of the GPU instances"
  value       = google_compute_address.gpu_vm_static_ip[*].address
}

output "instance_zones" {
  description = "Zones of the GPU instances"
  value       = google_compute_instance.gpu_vm[*].zone
}