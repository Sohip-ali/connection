resource "aws_s3_bucket" "terraform_state" {
  bucket = "sohip-app-migration-tf-state"
}