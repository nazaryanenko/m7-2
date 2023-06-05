locals {
  need_elastic_ip_num = var.need_elastic_ip ? 1 : 0
  need_volume_num     = var.need_volume ? 1 : 0
}

resource "aws_instance" "ec2-server" {
  ami                    = data.aws_ami.latest_ubuntu.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [var.vpc_security_group_id]
  availability_zone      = var.availability_zone

  tags = {
    Name    = var.name
    Owner   = "Nazar"
    Project = "Study"
  }
}

module "elastic_ip" {
  count           = local.need_elastic_ip_num
  source          = "../elastic_ip"
  ec2_instance_id = aws_instance.ec2-server.id
}

module "volume" {
  count             = local.need_volume_num
  source            = "../volume"
  availability_zone = aws_instance.ec2-server.availability_zone
  size              = var.volume_size
}

module "volume_attachment" {
  count           = local.need_volume_num
  source          = "../volume_attachment"
  ec2_instance_id = aws_instance.ec2-server.id
  volume_id       = module.volume[0].volume_id
}

