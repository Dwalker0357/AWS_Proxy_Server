provider "aws" {
    region = "eu-west-3"
    access_key = var.access_key
    secret_key = var.secret_key
}

module "ec2" {
    source                = "./ec2"
    realiti_proxy_net_id  = module.subnets.realiti_proxy_net_id
    realiti_net_id        = module.subnets.realiti_net_id
}
module "subnets" {
    source                        = "./subnets"
    vpc_id                        = module.vpc.vpc_id
    route_id                      = module.vpc.route_id
    realiti_proxy_sec_group_id    = module.vpc.realiti_proxy_sec_group_id
    realiti_sec_group_id          = module.vpc.realiti_sec_group_id
    internet_gate                 = module.vpc.internet_gate
}
module "vpc" {
    source          = "./vpc"
}
