resource "aws_network_acl" "subnet_acl" {
  vpc_id     = aws_vpc.vpc.id
  subnet_ids = ["${aws_subnet.subnet_pub.id}"]
  egress {
    protocol   = "icmp"
    rule_no    = 50
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
    icmp_type  = -1
    icmp_code  = -1
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }


  tags = {
    Name = "Grp${var.nbgroup}_acl_subnet"
  }
}
