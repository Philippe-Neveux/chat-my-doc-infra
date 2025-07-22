variable "region" {
  description = "Region where the Cloud Run service is deployed"
  type        = string
}

variable "invoker_email" {
  description = "Email address of the user who should have invoker access"
  type        = string
  default     = "pneveux.gcp@gmail.com"
}

variable "iap_client_id" {
  description = "OAuth 2.0 client ID for IAP"
  type        = string
  sensitive   = true
}

variable "iap_client_secret" {
  description = "OAuth 2.0 client secret for IAP"
  type        = string
  sensitive   = true
}