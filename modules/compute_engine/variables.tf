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

variable "ssh_public_key_path" {
  description = "Path to SSH public key file for accessing the VMs"
  type        = string
  default     = "~/.ssh/gcp_rag_llms.pub"
}