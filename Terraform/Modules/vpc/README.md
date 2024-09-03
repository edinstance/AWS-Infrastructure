This module is used to create a VPC with the following configurable inputs:

- `vpc_name`: The name of the VPC (default: `sandbox_aws_vpc`).
- `vpc_cidr`: The CIDR block for the VPC (default: `10.0.0.0/16`).
- `public_subnet_cidrs`: List of CIDR blocks for the public subnets (default: `["10.0.1.0/24"]`).
- `private_subnet_cidrs`: List of CIDR blocks for the private subnets (default: `["10.0.2.0/24"]`).
- `availability_zones`: List of Availability Zones to use (default: `["eu-west-2a"]`).

Example usage:

```hcl
module "vpc" {
  source = "./Modules/vpc/"

  vpc_name             = "my_custom_vpc"
  vpc_cidr             = "10.1.0.0/16"
  public_subnet_cidrs  = ["10.1.1.0/24", "10.1.2.0/24"]
  private_subnet_cidrs = ["10.1.3.0/24", "10.1.4.0/24"]
  availability_zones   = ["eu-west-2a", "eu-west-2b"]
} 

The default module looks like the diagram below, but it can be expanded to contain more. 


![image](https://github.com/user-attachments/assets/24b44767-1ce4-4349-a144-5ce61b28009e)
