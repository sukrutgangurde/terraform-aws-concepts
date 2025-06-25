provider "aws"{
   region = "ap-south-1"
}

resource "aws_instance" "myserver" {
   ami = "ami-id your ec2 instance"
   instance_type = "t2.micro"
   vpc_security_group_ids = [aws_security_group.mysg.id]
   tags = {
      Name = "newserver"
   }
   user_data=<<-EOF
   #!/bin/bash
   yum update -y
   yum install nginx -y
   service nginx start
	   echo "hello this is bin bash" >/usr/share/nginx/html/index.html
   EOF
  
}

resource "aws_security_group" "mysg" {
   name = "mysg"
   ingress {
      to_port = 80
      from_port = 80 
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
   }

   egress {
      to_port = 0
      from_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
   }
}


