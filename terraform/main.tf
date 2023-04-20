# main.tf

terraform {
  required_version = ">= 1.0"
  backend "local" {}
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  project = var.PROJECT
  region = var.REGION
}

resource "google_storage_bucket" "dtc-project-covid123" {
  name = var.GCS_NAME
  project = var.PROJECT
  location = var.REGION
  storage_class = "STANDARD"
  uniform_bucket_level_access = true
  force_destroy = true
}