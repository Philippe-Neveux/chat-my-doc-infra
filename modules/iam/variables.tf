variable "project_id" {
  description = "The ID of the Google Cloud project."
  type        = string
}

variable "service_accounts" {
  description = "A map of service accounts to create. The key is the logical name, and the value is an object with 'account_id' and 'display_name'."
  type = map(object({
    account_id    = string
    display_name  = string
    project_roles = list(string)
    repository    = string
  }))
  default = {
    gha_chat_my_doc_llm = {
      account_id    = "chat-my-doc-llm"
      display_name  = "GitHub Actions for chat-my-doc-llm"
      project_roles = [
        "roles/run.developer",
        "roles/artifactregistry.writer",
        "roles/iam.serviceAccountUser"
      ]
      repository    = "chat-my-doc-llms"
    },
    gha_chat_my_doc_app = {
      account_id    = "chat-my-doc-app"
      display_name  = "GitHub Actions for chat-my-doc-app"
      project_roles = [
        "roles/run.developer",
        "roles/artifactregistry.writer",
        "roles/iam.serviceAccountUser"
      ]
      repository    = "chat-my-doc-app"
    },
    compute_engine = {
      account_id    = "compute-engine-sa"
      display_name  = "Compute Engine Service Account"
      project_roles = [
        "roles/compute.instanceAdmin.v1",
        "roles/storage.admin"
      ]
      repository    = ""
    }
  }
}

variable "github_token" {
  description = "A GitHub personal access token with permissions to write repository secrets."
  type        = string
  sensitive   = true
}