# Configure the AWS Provider
provider "aws" {
  region        = "ap-south-1"
  # access_key    = "xxxxss"
  # secret_key    = "xxssxsss"
}

resource "aws_s3_bucket" "terraform4" {
  bucket = "terraform4"
  tags = {
    Name        = "terraform4"
    Environment = "Dev"
    CreatedBy   = "Terraform"
  }
}

resource "aws_s3_bucket" "terraform5" {
  bucket = "terraform5"
  tags = {
    Name        = "terraform5"
    Environment = "Dev"
    CreatedBy   = "Terraform"
  }
}