# This file configures the remote backend for Terraform state storage.
# The state file will be stored in a Google Cloud Storage bucket.
terraform {
  backend "gcs" {
    bucket = "gen-ai-466406-tfstate"
    prefix = "terraform/state"
  }
}
