variable "ami" {
  description = "The AMI to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
}

variable "subnet_id" {
  description = "The VPC subnet ID to launch in"
  type        = string
}

variable "security_groups" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
}

variable "ec2_name" {
  description = "The name to assign to the EC2 instance"
  type        = string
}

variable "associate_public_ip_address" {
  description = "Associate a public IP address with the instance"
  type        = bool
  default     = false
}

variable "create_key_pair" {
  description = "Boolean to determine if the key pair should be created"
  type        = bool
  default     = false
}

variable "key_pair_name" {
  description = "The name of the key pair to use"
  type        = string
}

variable "file_name" {
  description = "The name of the file to write the private key to"
  type        = string
}