# Google Cloud Storage bucket
resource "google_storage_bucket" "open-data" {
  name          = "rag-open-data"
  location      = var.location
  force_destroy = true

  uniform_bucket_level_access = true

  versioning {
    enabled = "false"
  }
}

