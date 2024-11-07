resource "aws_key_pair" "public_key" {
  key_name   = "key_public_ec2"
  public_key = file("~/.ssh/key_aws.pem.pub")
  #ssh-keygen -t rsa -b 2048 -m PEM -f ~/.ssh/key_aws.pem
}
