terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "ap-south-2"
}

resource "aws_instance" "my_instance" {
    ami = "ami-0fa91bc90632c73c9"
    instance_type = "t3.micro"
        tags = {
        Name = "jaya_instance_1"
        env  = "dev"
    }
    count = 3
}
