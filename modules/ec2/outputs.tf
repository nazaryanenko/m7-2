output "public_ip" {
  value = aws_instance.ec2-server.public_ip
}

output "private_ip" {
  value = aws_instance.ec2-server.private_ip
}

output "instance_id" {
  value = aws_instance.ec2-server.id
}

output "availability_zone" {
  value = aws_instance.ec2-server.availability_zone
}