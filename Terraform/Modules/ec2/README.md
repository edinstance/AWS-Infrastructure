This module is used to create an EC2 instance with the following configurable inputs:

- `ami`: The AMI to use for the instance.
- `instance_type`: The type of instance to start.
- `subnet_id`: The VPC subnet ID to launch in.
- `security_groups`: A list of security group IDs to associate with.
- `ec2_name`: The name to assign to the EC2 instance.
- `associate_public_ip_address`: Associate a public IP address with the instance (default: `false`).
- `key_pair_name`: The name of the key pair to use.
- `file_name`: The name of the file to write the private key to.

Example usage:

```hcl
module "ec2_instance" {
  source = "./Modules/ec2/"

  ami                       = "ami-0c0493bbac867d427"
  instance_type             = "t2.micro"
  subnet_id                 = module.vpc.public_subnet_ids[0]
  security_groups           = [module.security.web_server_sg_id]
  ec2_name                  = "frontend-application"
  associate_public_ip_address = true
  key_pair_name             = "my-key-pair"
  file_name                 = "private_key.pem"
}