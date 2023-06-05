resource "aws_volume_attachment" "volume_attachment" {
  device_name = "/dev/sdh"
  instance_id = var.ec2_instance_id
  volume_id   = var.volume_id
}