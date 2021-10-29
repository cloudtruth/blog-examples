terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      #version = "~> 3.27"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "cloudtruth" {
  ami               = var.ami
  instance_type     = var.instance_type 
  availability_zone = var.availability_zone_names[0]
  tags              = var.resource_tags
}