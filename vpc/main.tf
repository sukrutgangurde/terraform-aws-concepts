provider "aws" {
   region = "ap-south-1"
}

resource "aws_vpc" "custom_vpc"{
   cidr_block = "10.0.0.0/16"
   tags = {
     Name = "myVPC"
   }
}
resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.custom_vpc.id
  tags = {
    Name = "custom_IGW"
  }
}

resource "aws_subnet" "subnet1" {
   cidr_block = "10.0.1.0/28"
   vpc_id = aws_vpc.custom_vpc.id
   availability_zone= "ap-south-1a"
   tags = {
     Name = "subnet1"
   }
}
resource "aws_subnet" "subnet2" {
   cidr_block = "10.0.2.0/27"
   vpc_id = aws_vpc.custom_vpc.id
   availability_zone = "ap-south-1a"
   tags = {
     Name = "subenet2"
   }
}
resource "aws_route_table" "new_route_table"{
    vpc_id = aws_vpc.custom_vpc.id
    tags = {
      Name = "new_route_table"
    }
    route{
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.myigw.id
    }
}
resource "aws_route_table_association" "subent_asso1" {
   subnet_id = aws_subnet.subnet1.id
   route_table_id = aws_route_table.new_route_table.id
}
resource "aws_route_table_association" "subent_asso2" {
   subnet_id = aws_subnet.subnet2.id
   route_table_id = aws_route_table.new_route_table.id
}
