variable "aws_region" {
  default = "eu-central-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/18"
}

variable "pubsubcidr" {
  default = "10.0.0.0/24"
}

variable "privsubcidr" {
  default = "10.0.1.0/24"
}

variable "cidr_block" {
  default = "0.0.0.0/0"
}