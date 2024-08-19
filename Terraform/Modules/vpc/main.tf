


# This creates a VPC with CIDR block
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

# This creates public subnets with the CIDR blocks from the variables
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  count                   = length(var.public_subnet_cidrs)
  cidr_block              = element(var.public_subnet_cidrs, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "public-${count.index}"
  }
}

# This creates private subnets with the CIDR blocks from the variables
resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  count                   = length(var.private_subnet_cidrs)
  cidr_block              = element(var.private_subnet_cidrs, count.index)
  map_public_ip_on_launch = false

  tags = {
    Name = "private-${count.index}"
  }
}