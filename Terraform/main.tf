
terraform {
  required_version = ">= 1.9"
}

module "vpc" {
  source               = "./Modules/vpc/"
  vpc_name             = "sandbox_aws_vpc"
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24"]
  private_subnet_cidrs = ["10.0.2.0/24"]
  availability_zones   = ["eu-west-2a"]
}