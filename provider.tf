terraform {
  required_providers {
    google = {
      source  = "google"
      version = "3.5.0"
    }

    cloudflare = {
      source  = "registry.terraform.io/cloudflare/cloudflare"
      version = "2.18.0"
    }
  }
}
provider "google" {
  credentials = file(var.google_credentials_filepath)
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}
provider "cloudflare" {
  email     = var.cloudflare_email
  api_token = var.cloudflare_api_token
}
