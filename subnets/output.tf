output "proxy_server_public_ip" {
  value = aws_eip.elastic_realiti_proxy_address.public_ip
}

output "realiti_server_public_ip" {
  value = aws_eip.elastic_realiti_address.public_ip
}

output "realiti_proxy_net_id" {
  value = aws_network_interface.Realiti_Proxy_Network_Interface.id
}

output "realiti_net_id" {
  value = aws_network_interface.Realiti_Network_Interface.id
}