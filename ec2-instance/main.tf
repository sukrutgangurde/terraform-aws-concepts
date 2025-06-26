provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "ec2-instance" {
   ami = "ami-0b09627181c8d5778"
   instance_type = "t2.micro"
   tags = {
     Name = "server1"
   }
}
