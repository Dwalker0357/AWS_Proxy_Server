output "vpc_id" {
    value = aws_vpc.Dale_SaaS_Realiti_VPC.id
}
output "route_id" {
    value = aws_route_table.prod-route-table.id
}
output "realiti_sec_group_id" {
    value = aws_security_group.Realiti_Security_Group.id
}
output "realiti_proxy_sec_group_id" {
    value = aws_security_group.Realiti_Proxy_Security_Group.id
}
output "internet_gate" {
    value = aws_internet_gateway.gw
}  