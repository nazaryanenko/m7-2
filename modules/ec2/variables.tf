variable "name" {
  type    = string
  default = "Unnamed server"
}
variable "vpc_security_group_id" {
  type    = string
  default = ""
}

variable "image" {
  type    = string
  default = ""
}

variable "availability_zone" {
  type = string
  default = ""
}

variable "need_elastic_ip" {
  type    = bool
  default = false
}

variable "need_volume" {
  type    = bool
  default = false
}

variable "volume_size" {
  type    = number
  default = 1
}