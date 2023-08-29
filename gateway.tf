resource "aws_internet_gateway" "gw" {
 vpc_id = aws_vpc.ab_diplom_vpc.id
 
 tags = {
   Name = "Main IGW AB_Diplom"
 }
}

resource "aws_eip" "abEIP" {
  vpc = true
  count = 1 
  #depends_on = [ aws_internet_gateway.iwg ]
  instance = aws_instance.instance_ab_diplom_ubuntu[count.index].id
  tags = {
    Name = "NAT Getway EIP AB_Diplom"
  }
}