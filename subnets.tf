resource "aws_subnet" "public_subnets" {
 count      = length(var.public_subnet_cidrs)
 vpc_id     = aws_vpc.ab_diplom_vpc.id
 cidr_block = element(var.public_subnet_cidrs, count.index)
 availability_zone = element(var.azs, count.index)
 
 tags = {
   Name = "Public Subnet ${count.index + 1}"
 }
}

 
resource "aws_subnet" "rds_subnets" {
 count      = length(var.rds_subnet_cidrs)
 vpc_id     = aws_vpc.ab_diplom_vpc.id
 cidr_block = element(var.rds_subnet_cidrs, count.index)
 availability_zone = element(var.azs, count.index)
 
 tags = {
   Name = "RDS Subnet ${count.index + 1}"
 }
}


resource "aws_db_subnet_group" "rds_subnets_group" {
  name       = "rds_subnets_ab"
  subnet_ids   = flatten(["${aws_subnet.rds_subnets.*.id}"])

  tags = {
    Name = "RDS subnets group"
   } 
}