terraform {
  required_version = ">= 1.9"
}

resource "aws_security_group" "web_server_sg" {

  name        = "web-server-sg"
  description = "Security group for web-server with HTTPS ports open within VPC"
  vpc_id      = module.vpc.vpc_id
  
  ingress = [
    {
      description      = "https traffic"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = flatten(["0.0.0.0/0", module.vpc.public_subnet_cidr_blocks])
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      description      = "http traffic"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = flatten(["0.0.0.0/0", module.vpc.public_subnet_cidr_blocks])
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      description      = "ssh"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]
  
  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "Outbound traffic rule"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]
}

output "web_server_sg_id" {
  value = aws_security_group.web_server_sg.id
}