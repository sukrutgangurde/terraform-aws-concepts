resource "aws_vpc" "myvpc"{
  cidr_block = "10.0.0.0/16"
  tags = {
   Name = "myvpc"
  }
}

resource "aws_internet_gateway" "myigw" {
   vpc_id = aws_vpc.myvpc.id
   tags = {
     Name = "myigw"
   }
}

resource "aws_subnet" "subnet1" {
  cidr_block = "10.0.1.0/28"
  vpc_id = aws_vpc.myvpc.id
  availability_zone = "ap-south-1a"
  tags = {
    Name = "subnet1"
  }
}
resource "aws_route_table" "myroute" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "myroute"
  }
  route {
    gateway_id = aws_internet_gateway.myigw.id
    cidr_block = "0.0.0.0/0"
  }
}
