module "ec2" {
  source = "./modules"
  region = "ap-south-2"
  ami = "ami-0e7938ad51d883574"
  instance_type = "t3.micro"
  instance_name = "myapp-jaya"
  env = "dev"
}
