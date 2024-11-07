variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "nbgroup" {
  type    = string
  default = "1"
}

variable "role_vpc_flow_log" {
  type    = string
  default = "role_vpc_fl"
}

variable "role_ec2" {
  type    = string
  default = "esgi_EC2_Role"
}

variable "mail_alert" {
  type = string
}

