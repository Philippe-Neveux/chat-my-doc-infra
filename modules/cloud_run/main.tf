# Allow public access to LLM gateway Cloud Run service
resource "google_cloud_run_service_iam_binding" "llm-gateway" {
  location = var.region
  project  = var.project_id
  service  = "llm-gateway"
  role     = "roles/run.invoker"

  members = [
    "allUsers",
  ]
}

# Allow public access to Cloud Run service
resource "google_cloud_run_service_iam_binding" "rag-app" {
  location = var.region
  project  = var.project_id
  service  = "rag-app"
  role     = "roles/run.invoker"

  members = [
    "allUsers",
  ]
}