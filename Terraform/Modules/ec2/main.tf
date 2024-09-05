terraform {
  required_version = ">= 1.9"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.60.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">= 4.0.0"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 2.5.0"
    }
  }
}

resource "aws_instance" "ec2" {
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = var.subnet_id
  security_groups = var.security_groups

  key_name = var.create_key_pair ? var.key_pair_name : null

  associate_public_ip_address = var.associate_public_ip_address

  root_block_device {
    encrypted = true
  }

  metadata_options {
    http_tokens = "required"
  }

  tags = {
    Name = "ec2-${var.ec2_name}"
  }
}

resource "tls_private_key" "rsa" {
  count     = var.create_key_pair ? 1 : 0
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ec2_key" {
  count      = var.create_key_pair ? 1 : 0
  key_name   = var.key_pair_name
  public_key = tls_private_key.rsa[0].public_key_openssh
}

resource "local_file" "ec2_key" {
  count    = var.create_key_pair ? 1 : 0
  content  = tls_private_key.rsa[0].private_key_pem
  filename = var.file_name

}
