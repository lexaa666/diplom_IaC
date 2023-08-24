resource "aws_route_table" "public" {
  vpc_id = aws_vpc.ab_diplom_vpc.id
  route {
    cidr_block     = var.cidr_block
    gateway_id = aws_internet_gateway.iwg.id
  }
  tags = {
    Name = "Public Route Table AB_Diplom"
  }
}

resource "aws_route_table_association" "PubRTAss" {
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.ab_diplom_publicsubnet.id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.ab_diplom_vpc.id
  route {
    cidr_block = var.cidr_block
    gateway_id = aws_nat_gateway.NAT-GW.id 
  }
  tags = {
    Name = "Private Route Table AB_Diplom"
  }
}

resource "aws_route_table_association" "PrivRTAss" {
  route_table_id = aws_route_table.private.id
  subnet_id      = aws_subnet.ab_diplom_privlicsubnet.id
}