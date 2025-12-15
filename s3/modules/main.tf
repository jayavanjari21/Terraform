resource "aws_s3_bucket" "my_bucket" {
    bucket =  var.bucket

tags = {
    Name = var.Name
    env = var.env
}  
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_versioning" "my_version" {
  bucket = aws_s3_bucket.my_bucket.id 

versioning_configuration {
  status = var.status
}
}
