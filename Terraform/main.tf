

module "vpc" {
  source               = "./Modules/vpc/"
  vpc_name             = "sandbox_aws_vpc"
  vpc_cidr             = "10.0.0.0/16"
}