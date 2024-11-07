resource "aws_security_group" "security_group_admin" {
  name        = "Group${var.nbgroup}_EC2server_sg"
  description = "Allow HTTPS, HTTP, SSH"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = "allow_admin"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ssh" {
  security_group_id = aws_security_group.security_group_admin.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_http" {
  security_group_id = aws_security_group.security_group_admin.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}


resource "aws_vpc_security_group_ingress_rule" "allow_tls_https" {
  security_group_id = aws_security_group.security_group_admin.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_security_group_rule" "egress_all" {
  security_group_id = aws_security_group.security_group_admin.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]

}
