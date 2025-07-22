resource "google_cloud_run_v2_service_iam_binding" "invoker" {
  name     = "llm-gateway"  # Replace with your actual service name
  location = var.region
  role     = "roles/run.invoker"
  members  = [
    "user:${var.invoker_email}"
  ]
}