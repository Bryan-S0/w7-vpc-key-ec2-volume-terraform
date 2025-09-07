resource "aws_s3_bucket" "s3" {
  bucket = "w7-sk-s3bkt"

  tags = {
    Name = "My bucket"
    Env  = "Dev"
  }
}