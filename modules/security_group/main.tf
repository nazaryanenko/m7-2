resource "aws_security_group" "security_group" {
  name        = "first_security_group"
  description = "our security group"

  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      description = "open port ${ingress.value}"
      from_port   = ingress.value
      protocol    = "tcp"
      to_port     = ingress.value
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
