

resource "aws_key_pair" "key" {
  key_name   = "ab_diplom_key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "instance_ab_diplom_ubuntu" {
  count = 1
  subnet_id = aws_subnet.public_subnets[count.index].id
  ami           = "ami-04e601abe3e1a910f"
  instance_type = "t2.medium"
  key_name      = aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.allow_http_ssh_pub.id]
  associate_public_ip_address = true
  user_data     =  "${file("install_docker.sh")}"
  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = 20
  }
  tags = {
    Name = "Superset_${count.index}"
  }
}


resource "aws_db_instance" "postgresql_ab_diplom" {
  allocated_storage    = 5
  db_subnet_group_name = aws_db_subnet_group.rds_subnets_group.name
  db_name              = "superset_db"
  engine               = "postgres"
  engine_version       = "12.11"
  instance_class       = "db.t3.micro"
  username             =  var.username
  password             =  var.password
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.postgres_db_sg.id]
}