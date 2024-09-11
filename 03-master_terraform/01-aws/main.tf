terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-southeast-2"
  access_key = ""
  secret_key = ""
}

# resource "<provider>_<resource_type>" "local_name" {
#   argument1 = value1
#   argument2 = value2
#   ...
# }

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  
  tags = {
    "Name" = "Main VPC"
  }
}