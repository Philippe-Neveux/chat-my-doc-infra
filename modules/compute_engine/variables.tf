variable "zone" {
  description = "The zone to deploy the VMs in"
  type        = string
}

variable "service_account_email" {
  description = "Service account email for the VMs"
  type        = string
  default     = null
}

variable "vm_names" {
  description = "List of VM names"
  type        = list(string)
  default     = ["mistral-7b-instruct", "llama-3-7b-instruct"]
}