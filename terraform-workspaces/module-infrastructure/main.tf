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

module "instance" {
  ami                     = var.ami
  instance_type           = var.instance_type 
  availability_zone_names = var.availability_zone_names
  resource_tags           = var.resource_tags
  source = "git::https://github.com/cloudtruth-demo/terragrunt-cloudtruth-modules.git//instance?ref=v0.0.1"    
}