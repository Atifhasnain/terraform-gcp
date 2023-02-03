variable "project_id" {
  type    = string
  default = "enter your GCP account project ID"
}

variable "region" {
  type    = string
  default = "us-central1-c"
}

variable "zone" {
  type    = string
  default = "us-central1-c"
}

variable "instance_name" {
  type    = string
  default = "default-instance"
}
variable "ssh_public_key_filepath" {
  description = "Filepath for the ssh public key"
  type        = string
  default     = "Keys/ubuntu.pub"
}
variable "google_credentials_filepath" {
  description = "Filepath for the GCP Credentials"
  type        = string
  default     = "Keys/enter your GCP Service account Key file name .json"
}

variable "ssh_private_key_filepath" {
  description = "Filepath for the ssh private key"
  type        = string
  default     = "Keys/ubuntu"
}
variable "machine_type" {
  type    = string
  default = "e2-micro"
}

variable "image" {
  type    = string
  default = "debian-cloud/debian-10"
}

variable "disk_size" {
  type    = number
  default = 100
}

variable "cloudflare_email" {
  type    = string
  default = "enter your cloudflare account email address"
}

variable "cloudflare_api_token" {
  type    = string
  default = "enter your cloudflare api token"
}

variable "cloudflare_zone_id" {
  type    = string
  default = "enter your cloudflare zone id for domain"
}

variable "domain_name" {
  type = string
}
variable "vpc_network_name" {
  description = "VPC Network Name"
  default     = "default"
}

variable "local_ssh_key" {
  type        = string
  description = "Local SSH Key to be added in authorized_keys of newly created VM"
  default     = "/home/terraform/.ssh/id_rsa.pub"
}
