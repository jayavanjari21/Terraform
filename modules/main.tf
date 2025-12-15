provider "aws" {
  region = var.region
}

resource "aws_instance" "my_instance"{
  ami = var.ami
  instance_type = var.instance_type

  user_data = <<-EOF
  sudo apt update -y
  sudo apt install nginx -y
  echo "<h1> Hello World" > /var/www/html/index.html
  EOF

  tags = {
    instance_name = var.instance_name
    env = var.env
  }
}
