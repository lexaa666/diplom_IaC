resource "aws_subnet" "ab_diplom_publicsubnet" {
  vpc_id     = aws_vpc.ab_diplom_vpc.id
  cidr_block = var.pubsubcidr
  tags = {
    Name= "Public Subnet"
  }
}

resource "aws_subnet" "ab_diplom_privlicsubnet" {
  vpc_id     = aws_vpc.ab_diplom_vpc.id
  cidr_block = var.privsubcidr
  tags = {
    Name= "Privet Subnet"
  }
}