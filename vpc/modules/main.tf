provider "aws" {
  region = var.region
}

resource "aws_vpc" "my_vpc" {
    cidr_block = var.vpc_cidr_block

    tags = {
        Name = "${var.project}-vpc"
    }
}

resource "aws_subnet" "pub_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.vpc_cidr_pub_subnet
  availability_zone = "us-east-2a"
  map_public_ip_on_launch = true
   tags = {
        Name = "${var.project}-pub-subnet"
    }
}

resource "aws_subnet" "pri_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.vpc_cidr_pri_subnet
  availability_zone = "us-east-2a"
   tags = {
        Name = "${var.project}-pri-subnet"
    }
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "${var.project}-my-igw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.pub_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route_table_association" "private_assoc" {
  subnet_id      = aws_subnet.pri_subnet.id
  route_table_id = aws_route_table.private_rt.id
}
