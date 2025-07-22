# Chat My Doc Infrastructure

Terraform configuration for deploying Google Cloud infrastructure for the Chat My Doc application.

## Overview

This infrastructure includes:
- Project API enablement
- IAM service accounts and keys
- Artifact Registry repositories
- Cloud Run service IAM configuration

## Prerequisites

- Google Cloud SDK installed and configured
- Terraform >= 1.0
- Access to a Google Cloud project
- GitHub personal access token (for repository secrets)

## Configuration

### Required Variables

Create a `terraform.tfvars` file with the following variables:

```hcl
project_id = "your-project-id"
location = "australia-southeast1"
region = "australia-southeast1"
zone = "australia-southeast1-b"
github_owner = "your-github-username"
github_token = "your-github-token"
```

The `cloud_run_invoker_email` variable has a default value set to `pneveux.gcp@gmail.com`. Update this in `modules/cloud_run/variables.tf` if needed.

## Usage

1. **Initialize Terraform:**
   ```bash
   terraform init
   ```

2. **Plan the deployment:**
   ```bash
   terraform plan
   ```

3. **Apply the configuration:**
   ```bash
   terraform apply
   ```

## Modules

### Project Services
Enables required Google Cloud APIs for the project.

### IAM
Creates service accounts and manages their keys, storing them as GitHub repository secrets.

### Artifact Registry
Sets up container repositories for storing Docker images.

### Cloud Run
Configures IAM policy binding to grant Cloud Run invoker access to the specified user.

## Cloud Run IAM Access

The Cloud Run module automatically grants `roles/run.invoker` permission to the user specified in the `cloud_run_invoker_email` variable. This is equivalent to running:

```bash
gcloud run services add-iam-policy-binding llm-gateway \
    --member="user:pneveux.gcp@gmail.com" \
    --role="roles/run.invoker" \
    --region=australia-southeast1
```

## Outputs

Check `outputs.tf` for available output values after deployment.

## Cleanup

To destroy all resources:

```bash
terraform destroy
```