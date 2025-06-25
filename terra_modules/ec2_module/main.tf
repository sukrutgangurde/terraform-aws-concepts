resource "aws_instance" "myec2" {
  ami = "ami-id_of your ec2 instance"
  instance_type = "t2.micro"
  tags = {
    Name = "myec2"
  }
}
