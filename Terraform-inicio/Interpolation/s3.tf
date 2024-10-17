
resource "aws_s3_bucket" "this" {
  bucket = "${random_pet.bucket.id}-${var.environment}"

  tags = {
    Service     = var.service
    Environment = var.environment
    Managedby   = "Terraform"
    Owner       = var.owner
  }
}