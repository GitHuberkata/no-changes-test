terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.53.0"
    }
  }
}

resource "null_resource" "screen_output" {
count = 21000
  provisioner "local-exec" {
    command = <<EOT
    echo 'Hello'
    EOT
  }
}


provider "aws" {
  region = "us-west-2"
}


resource "aws_instance" "myec2" {
  ami           = "ami-06e85d4c3149db26a"
  instance_type = "t2.micro"

  tags = {
    Name = "westVM-second-change"
  }
}
