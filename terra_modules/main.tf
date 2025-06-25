provider "aws" {
  region = "ap-south-1"
}

module "ec2_instance_module" {
  source = "./ec2_module/"
}

module "vpc_module" {
  source = "./vpc_module/"
}
