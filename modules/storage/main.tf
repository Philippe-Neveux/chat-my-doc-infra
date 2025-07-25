# Google Cloud Storage bucket
resource "google_storage_bucket" "main" {
  name          = "open-data"
  location      = var.region
  force_destroy = false

  uniform_bucket_level_access = true

  versioning {
    enabled = "false"
  }
}

