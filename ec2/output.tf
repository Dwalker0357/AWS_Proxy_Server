output "realiti_proxy_private_ip" {
  value = aws_instance.Dale_SaaS_Realiti_Proxy_Server.private_ip
}
output "realiti_proxy_public_ip"{
  value = aws_instance.Dale_SaaS_Realiti_Proxy_Server.public_ip
}
output "realiti_proxys_id" {
  value = aws_instance.Dale_SaaS_Realiti_Proxy_Server.id
}


output "realiti_private_ip" {
  value = aws_instance.Dale_SaaS_Realiti_Server.private_ip
}
output "realiti_public_ip"{
  value = aws_instance.Dale_SaaS_Realiti_Server.public_ip
}
output "realiti_id" {
  value = aws_instance.Dale_SaaS_Realiti_Server.id
}