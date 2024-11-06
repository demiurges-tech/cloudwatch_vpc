resource "aws_subnet" "subnet_pub" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.${var.nbgroup}.1.0/24"
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "Group${var.nbgroup}_SubPub"
  }
}
