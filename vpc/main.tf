resource "aws_vpc" "Dale_SaaS_Realiti_VPC" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Dale_SaaS_Realiti_VPC"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.Dale_SaaS_Realiti_VPC.id
}

resource "aws_route_table" "prod-route-table" {
  vpc_id = aws_vpc.Dale_SaaS_Realiti_VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  route {
     ipv6_cidr_block = "::/0"
     gateway_id      = aws_internet_gateway.gw.id
   }

   tags = {
     Name = "Realit Prod"
   }
}

resource "aws_security_group" "Realiti_Proxy_Security_Group" {
  name        = "Realiti_Proxy_Security_Group"
  description = "Locked Down Firewall"
  vpc_id      = aws_vpc.Dale_SaaS_Realiti_VPC.id

  ingress {
    description = "Dale Home Access"
    from_port   = 0
    to_port     = 0
    protocol    = "All"
    cidr_blocks = ["IP-Address/32"]
  }

  ingress {
    description = "VPC Connection Access"
    from_port   = 0
    to_port     = 0
    protocol    = "All"
    cidr_blocks = ["10.0.0.0/16"]
  }

  ingress {
    description = "Office Access"
    from_port   = 0
    to_port     = 0
    protocol    = "All"
    cidr_blocks = ["IP-Address/32"]
  }  

  ingress {
    description = "Office VPN Access"
    from_port   = 0
    to_port     = 0
    protocol    = "All"
    cidr_blocks = ["IP-Address/32"]
  } 

  egress {
    description = "OutBound Traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Dale_Realiti_Proxy_Security_Group"
  }

}

resource "aws_security_group" "Realiti_Security_Group" {
  name        = "Realiti_Security_Group"
  description = "Locked Down Realit Security Group"
  vpc_id      = aws_vpc.Dale_SaaS_Realiti_VPC.id

  ingress {
    description = "Dale Home Access"
    from_port   = 0
    to_port     = 0
    protocol    = "All"
    cidr_blocks = ["IP-Address/32"]
  }

  ingress {
    description = "VPC Connection Access"
    from_port   = 0
    to_port     = 0
    protocol    = "All"
    cidr_blocks = ["10.0.0.0/16"]
  }

  ingress {
    description = "Office SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["IP-Address/32"]
  }  

  ingress {
    description = "Office VPN SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["IP-Address/32"]
  }

  egress {
    description = "OutBound Traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Dale_Realiti_Security_Group"
  }

}
