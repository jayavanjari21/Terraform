provider "aws" {
    region = var.region
}

resource "aws_instance" "my-instance" {
    ami           = var.ami
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.aws_sg.id]

    user_data = <<-EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt install nginx -y
    echo "<h1> Hello World </h1>" > /var/www/html/index.html
    EOF

    tags = {
        env = var.env
    }
}

resource "aws_security_group" "aws_sg" {
    name = var.name
    description = "Allow All Traffic"
    vpc_id = var.vpc_id

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        env = var.env
    }
}
