variable "region" {
  description = "Region where the Cloud Run service is deployed"
  type        = string
}

variable "invoker_email" {
  description = "Email address of the user who should have invoker access"
  type        = string
  default     = "pneveux.gcp@gmail.com"
}