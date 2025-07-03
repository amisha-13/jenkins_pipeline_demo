terraform {
  backend "s3" {
    bucket = "terraform-training-s3-bucket"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}