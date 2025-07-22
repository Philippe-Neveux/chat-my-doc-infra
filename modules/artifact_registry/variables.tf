variable "location" {
  description = "The location for the Artifact Registry repositories."
  type        = string
}

variable "repository_names" {
  description = "A list of Artifact Registry repository names to create."
  type        = list(string)
  default     = ["app-images", "api-images", "llm-images"]
}

variable "repository_format" {
  description = "The format of the repositories."
  type        = string
  default     = "DOCKER"
}
