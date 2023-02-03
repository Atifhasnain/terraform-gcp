resource "google_service_account" "bucket_admin" {
  account_id = "bucket-admin"
  display_name = "Bucket Admin Service Account"
}

resource "google_project_iam_member" "bucket_admin_role_binding" {
  role = "roles/storage.admin"
  member = "serviceAccount:${google_service_account.bucket_admin.email}"
}

resource "google_service_account_key" "bucket_key" {
  service_account_id = google_service_account.bucket_admin.name
}

data "google_service_account_key" "mykey" {
  name            = google_service_account_key.bucket_key.name
  public_key_type = "TYPE_X509_PEM_FILE"
}

resource "local_file" "myaccountjson" {
    content     = "${base64decode(google_service_account_key.bucket_key.private_key)}"
    filename = "${local.bucket_name}.json"
}

