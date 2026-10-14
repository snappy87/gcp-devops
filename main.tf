terraform {
  required_version = ">= 1.5.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = "project-d10f1d96-3256-4b0c-8cc" # Your GCP project ID from gcloud
  region  = "us-central1"
}

# Simple test resource (GCS bucket)
resource "google_storage_bucket" "itest_bucket" {
  name                     = "saurabh-gcp-interview-test-bucket-2026"
  location                 = "US"
  force_destroy            = true
  public_access_prevention = "enforced"
}