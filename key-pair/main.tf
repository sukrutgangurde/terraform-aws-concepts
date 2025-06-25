provider "aws" {
region = "ap-south-1"
}

resource "aws_key_pair" "myterrakey"{
   key_name = "myterrakey"
   public_key = tls_private_key.rsa.public_key_openssh
}

resource "tls_private_key" "rsa" {
   algorithm = "RSA"
   rsa_bits = 4096
}

resource "local_file" "myterrakey" {
   content = tls_private_key.rsa.private_key_pem
   filename= "myterrakey"
}
