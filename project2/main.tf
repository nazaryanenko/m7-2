provider "aws" {
  region     = var.region
}

locals {
  availability_zones = slice(data.aws_availability_zones.available.names, 0, 2)
}


module "security_group" {
  source = "../modules/security_group"
}

module "database" {
  source                = "../modules/ec2"
  name                  = "database"
  need_elastic_ip       = false
  need_volume           = true
  volume_size           = 2
  vpc_security_group_id = module.security_group.security_group_id
}

module "backend" {
  source                = "../modules/ec2"
  name                  = "backend ${each.key}"
  for_each              = toset(local.availability_zones)
  depends_on            = [module.database]
  need_elastic_ip       = true
  need_volume           = false
  availability_zone     = each.value
  vpc_security_group_id = module.security_group.security_group_id
}

module "frontend" {
  source                = "../modules/ec2"
  name                  = "frontend"
  depends_on            = [module.backend]
  need_elastic_ip       = true
  need_volume           = false
  vpc_security_group_id = module.security_group.security_group_id
}
