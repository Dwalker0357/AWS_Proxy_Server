resource "aws_instance" "Dale_SaaS_Realiti_Proxy_Server" {
  ami               = "ami-0c6ebbd55ab05f070"
  instance_type     = "t3.micro"
  availability_zone = "eu-west-3c"
  key_name          = "dalepem"
  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = 10
  }

  network_interface {
    device_index         = 0
    network_interface_id = var.realiti_proxy_net_id
  }

  tags = {
    Name = "Dale_SaaS_Realiti12_Proxy_Server"
    Required = "12x5"
  }
}



resource "aws_instance" "Dale_SaaS_Realiti_Server" {
  ami               = "ami-018c55e9d34f949e9"
  instance_type     = "t3.2xlarge"
  availability_zone = "eu-west-3c"
  key_name          = "dalepem"
   ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = 75
  }
  
  network_interface {
    device_index         = 0
    network_interface_id = var.realiti_net_id
  }
  
  tags = {
  Name = "Dale_SaaS_Realiti12_Server"
  Required = "12x5"
  }
}