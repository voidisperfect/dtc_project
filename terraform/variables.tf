variable "PROJECT" {
  description = "Project ID"
  default = "dtc-covid"
  type = string
}

variable "GCS_NAME" {
  description = "Google Cloud Storage name"
  default = "dtc-project-covid123"
  type = string
}

variable "REGION" {
  description = "Region for GCP resources"
  default = "US"
  type = string
}
