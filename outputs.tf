output "gpu_vm_names" {
  description = "Names of the GPU-enabled VM instances"
  value       = module.compute_engine.instance_names
}

output "gpu_vm_ips" {
  description = "External IP addresses of the GPU-enabled VM instances"
  value       = module.compute_engine.instance_ips
}

output "gpu_vm_zones" {
  description = "Zones where the GPU-enabled VM instances are deployed"
  value       = module.compute_engine.instance_zones
}