resource "aws_vpc" "ab_diplom_vpc" {
  cidr_block = var.vpc_cidr
   tags = {
    Name = "ab_diplom_vpc"
  }
}