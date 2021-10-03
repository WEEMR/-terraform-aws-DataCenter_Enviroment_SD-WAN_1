module "Prod_VPC" {
  source          = "./AWS_VPC_US-East-1"
  access_key      = var.access_key
  secret_key      = var.secret_key
  username        = var.username
  virginia_region = var.virginia_region
  Public_Hosted_Zone = var.Public_Hosted_Zone
  SubHosted_Zone = var.SubHosted_Zone

  # VPC CIDR & Subnets

  prod_vpc_cidr          = var.prod_vpc_cidr
  # Spoke 1
  spoke_1_wan1_subnet_cidr       = var.spoke_1_wan1_subnet_cidr
  spoke_1_wan2_subnet_cidr       = var.spoke_1_wan2_subnet_cidr
  spoke_1_private_subnet_cidr    = var.spoke_1_private_subnet_cidr
  # Spoke 2

}

module "Spoke_1" {
  source                   = "./Spoke_1"
  access_key               = var.access_key
  secret_key               = var.secret_key

  # Global dependencies

  username                 = var.username
  Password                 = var.Password
  keyname                  = var.keyname
  virginia_region          = var.virginia_region
  Public_SubHosted_Zone_id = module.Prod_VPC.Public_SubHosted_Zone_id

  # Security Groups 
  
  default_SG                = module.Prod_VPC.default_SG
  Public_SG                 = module.Prod_VPC.Public_SG
  Private_SG                = module.Prod_VPC.Private_SG
  
  # Spoke 1 Specific dependencies

  spoke_1_wan1_subnet_cidr       = var.spoke_1_wan1_subnet_cidr
  spoke_1_wan2_subnet_cidr       = var.spoke_1_wan2_subnet_cidr
  spoke_1_private_subnet_cidr    = var.spoke_1_private_subnet_cidr

  spoke_1_wan1_subnet_id    = module.Prod_VPC.spoke_1_wan1_subnet_id
  spoke_1_wan2_subnet_id    = module.Prod_VPC.spoke_1_wan2_subnet_id
  spoke_1_private_subnet_id = module.Prod_VPC.spoke_1_private_subnet_id
  spoke_1_pvt_rt_id         = module.Prod_VPC.spoke_1_pvt_rt_id


  # FGT, Ubuntu and Windows Private IPs

  spoke_1_wan1_pvt_ip       = var.spoke_1_wan1_pvt_ip
  spoke_1_wan2_pvt_ip       = var.spoke_1_wan2_pvt_ip
  spoke_1_lan_pvt_IP        = var.spoke_1_lan_pvt_IP
  spoke_1_Ubuntu_LAN_IP     = var.spoke_1_Ubuntu_LAN_IP
  spoke_1_WinSrv_LAN_IP     = var.spoke_1_WinSrv_LAN_IP

}