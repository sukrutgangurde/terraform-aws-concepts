provider "aws" {
   region = "ap-south-1"
}

resource "aws_s3_bucket" "mybucket" {
   bucket = "my-unique-bucket_name"
  
   tags = {
      Name = "bucket1234"
      Environment = "Dev"
   }
}
