
resource "aws_internet_gateway" "iwg" {
  vpc_id = aws_vpc.ab_diplom_vpc.id
  tags = {
    Name = "Main IGW AB_Diplom"
  }
}
resource "aws_eip" "abEIP" {
  vpc = true
  depends_on = [ aws_internet_gateway.iwg ]
  tags = {
    Name = "NAT Getway EIP AB_Diplom"
  }
}

resource "aws_nat_gateway" "NAT-GW" {
  allocation_id = aws_eip.abEIP.id
  subnet_id     = aws_subnet.ab_diplom_publicsubnet.id
  tags = {
    Name = "Main NAT Getway AB_Diplom"
  }
}