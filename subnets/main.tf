resource "aws_subnet" "Realiti_Subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-west-3c"
  tags = {
    Name = "Realiti_Subnet"
  }
}

resource "aws_route_table_association" "Realiti" {
  subnet_id      = aws_subnet.Realiti_Subnet.id
  route_table_id = var.route_id
}

resource "aws_network_interface" "Realiti_Proxy_Network_Interface" {
  subnet_id       = aws_subnet.Realiti_Subnet.id
  private_ips     = ["10.0.1.50"]
  security_groups = [var.realiti_proxy_sec_group_id]
}

resource "aws_network_interface" "Realiti_Network_Interface" {
  subnet_id       = aws_subnet.Realiti_Subnet.id
  private_ips     = ["10.0.1.60"]
  security_groups = [var.realiti_sec_group_id]
}

resource "aws_eip" "elastic_realiti_proxy_address" {
  vpc                       = true
  network_interface         = aws_network_interface.Realiti_Proxy_Network_Interface.id
  associate_with_private_ip = "10.0.1.50"
  
}

resource "aws_eip" "elastic_realiti_address" {
  vpc                       = true
  network_interface         = aws_network_interface.Realiti_Network_Interface.id
  associate_with_private_ip = "10.0.1.60"
  depends_on                = [var.internet_gate]
}