provider "aws" {
    region = "ap-south-1"
}

terraform {
    required_providers {
        aws = {
            souce = "hashicorp/aws"
            version = "6.0.0"
        }
    }
}