resource "aws_subnet" "subnet_pub" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.${var.nbgroup}.1.0/24"
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "Group${var.nbgroup}_SubPub"
  }
}

resource "aws_route_table" "pub_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }

  tags = {
    Name = "Grp${var.nbgroup}_pub_table"
  }
}

resource "aws_route_table_association" "ass_pub1" {
  subnet_id      = aws_subnet.subnet_pub.id
  route_table_id = aws_route_table.pub_table.id
}
