resource "aws_eip" "elastic_ip" {
  domain   = "vpc"
  instance = var.ec2_instance_id
}