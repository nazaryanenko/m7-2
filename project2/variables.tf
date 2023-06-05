variable "region" {
  description = "aws region"
  default     = "eu-central-1"
}

variable "ingress_ports" {
  type    = list(string)
  default = ["22", "80", "443", "3000"]
}