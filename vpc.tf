resource "aws_vpc" "vpc" {
  cidr_block           = "10.${var.nbgroup}.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    "Name" = "Group${var.nbgroup}_vpc"
  }
}

resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    "Name" = "Group${var.nbgroup}_InternetGateway"
  }
}

