resource "google_storage_bucket" "stemly_bucket" {
  name     = local.bucket_name
  project  = var.project_id
  location = "asia-southeast1"
}

