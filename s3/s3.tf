module "s3" {
    source = "./modules"
    bucket = "jaya_bucket_12349876"
    region = "ap-south-2"
    Name = "jaya_new_bucket"
    env = "dev"
    status = "Enabled"
}
