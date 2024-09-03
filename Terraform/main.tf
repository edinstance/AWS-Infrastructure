
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

module "ec2" {
  source          = "./Modules/ec2/"
  ami             = "ami-0c0493bbac867d427"
  instance_type   = "t2.micro"
  subnet_id       = module.vpc.public_subnet_ids[0]
  security_groups = [aws_security_group.web_server_sg.id]
  ec2_name        = "frontend-application"
  associate_public_ip_address = true
  key_pair_name   = "frontend-ec2-key"
  file_name       = "frontend-ec2-key.pem"
}
