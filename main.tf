# Configure the AWS Provider
provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket = "terraformdemo-tf-state"
    key = "platform.tfstate"
    region = "ap-southeast-1"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "ubuntu" {
  ami            = "ami-07651f0c4c315a529"
  instance_type  = "t3.micro"
  subnet_id      = "subnet-09903fd5eb7eccfc0"
}

