resource "random_id" "random" {
  byte_length = 4
}

resource "google_storage_bucket" "example-bucket" {
  project   = var.project_id
  name      = "bucket-example-${random_id.random.hex}"
  location  = "eur4"
}
