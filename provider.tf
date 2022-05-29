terraform {
  backend "s3" {
    bucket = "464311365374-terraform-tfstate"
    key    = "dev/terraform.tfstate"
    region = "eu-central-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.9.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}