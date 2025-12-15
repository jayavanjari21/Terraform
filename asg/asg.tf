module "autoscaling" {
  source  = "./modules"
  version = "9.0.2"
  region = "ap-south-2"
  name_prefix = "jaya-asg"
  vpc_zone_identifier = ["subnet-00e6319a0a88945ee", "subnet-03fe18304f51a1530"]
  desired_capacity = 2
  max_size = 4
  min_size = 1

  launch_template_name = "jaya-launch-template"
  image_id = "ami-0e7938ad51d883574"
  instance_type = "t3.micro"
  key_name = "test-key"

}
