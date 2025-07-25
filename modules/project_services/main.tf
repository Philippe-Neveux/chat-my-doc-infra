# --- API Services ---

# Enable the Cloud Resource Manager API, required to manage other project services
resource "google_project_service" "cloudresourcemanager_api" {
  service            = "cloudresourcemanager.googleapis.com"
  disable_on_destroy = false
}

# Enable the IAM API to allow managing service accounts
resource "google_project_service" "iam_api" {
  service            = "iam.googleapis.com"
  disable_on_destroy = false
}

# Enable the Artifact Registry API
resource "google_project_service" "artifactregistry_api" {
  service            = "artifactregistry.googleapis.com"
  disable_on_destroy = false
}

# Enable the Cloud Run API
resource "google_project_service" "cloudrun_api" {
  service            = "run.googleapis.com"
  disable_on_destroy = false
}


# Enable the Cloud Storage API
resource "google_project_service" "storage_api" {
  service            = "storage.googleapis.com"
  disable_on_destroy = false
}