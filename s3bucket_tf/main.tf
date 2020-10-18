# Configure the AWS Provider
provider "aws" {
  region        = "ap-south-1"
  # access_key    = "xxxxss"
  # secret_key    = "xxssxsss"
}

resource "aws_s3_bucket" "terraform" {
  bucket = "ajstf3"
  tags = {
    Name        = "tform"
    Environment = "Dev"
    CreatedBy   = "Terraform"
  }
}

# resource "aws_s3_bucket" "terraform4" {
#   bucket = "terraform2"
#   tags = {
#     Name        = "terraform6"
#     Environment = "Dev"
#     CreatedBy   = "Terraform"
#   }
# }