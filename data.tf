data "aws_availability_zones" "available" {}

data "aws_iam_role" "arn_log_iam" {
  name = var.role_vpc_flow_log
}

data "aws_ami" "image" {
  most_recent = true

  filter {
    name   = "name"
    values = ["al2023*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

}


