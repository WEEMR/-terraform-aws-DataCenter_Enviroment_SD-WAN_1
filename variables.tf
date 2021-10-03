##############################################################################################################
#                                                                                                            #
#                                Data Center - Module 1 Terraform deployment                                 #
#                                                                                                            #
##############################################################################################################

# Access and secret keys to your environment

variable "access_key" {}
variable "secret_key" {}

# AWS Key Name to create Resources
variable "keyname" {}

# Devices Username and Password
variable "username" {
  description = "Provide the name of the user who will own the deployed resources"
}
variable "Password" {
    description = "Provide the password which will be used to login to all the deployed resources"
}

// -------------------------------------------------------------------------------- DNS

variable "Public_Hosted_Zone" {}
variable "SubHosted_Zone" {}

// -------------------------------------------------------------------------------- Region

variable "virginia_region" {
  description = "Provide the region to deploy the VPC in"
  default     = "us-east-1"
}

// -------------------------------------------------------------------------------- Prod VPC CIDR Block

variable "prod_vpc_cidr" {
  default = "10.150.0.0/16"
}

# ------------------------------------------------------------------------------------------------------------

#                                                  Spoke 1

# ------------------------------------------------------------------------------------------------------------

// Subnets 

variable "spoke_1_wan1_subnet_cidr" {
  description = "Provide the network CIDR for the Prod VPC"
  default     = "10.150.1.0/24"
}

variable "spoke_1_wan2_subnet_cidr" {
  description = "Provide the Prod VPC Windows network CIDR"
  default     = "10.150.2.0/24"
}

variable "spoke_1_private_subnet_cidr" {
  description = "Provide the Prod VPC Linux network CIDR"
  default     = "10.150.3.0/24"
}


// FGT IPs

variable "spoke_1_wan1_pvt_ip" {
  description = "Provide the network CIDR for the Prod VPC"
  default     = ["10.150.1.10"]
}

variable "spoke_1_wan2_pvt_ip" {
  description = "Provide the network CIDR for the Prod VPC"
  default     = ["10.150.2.10"]
}

variable "spoke_1_lan_pvt_IP" {
  description = "Provide the network CIDR for the Prod VPC"
  default     = ["10.150.3.10"]
}

# Ubuntu

variable "spoke_1_Ubuntu_LAN_IP" {
  description = "Provide the network CIDR for the Prod VPC"
  default     = ["10.150.3.20"]
}

# Windows

variable "spoke_1_WinSrv_LAN_IP" {
  description = "Provide the network CIDR for the Prod VPC"
  default     = ["10.150.3.25"]
}

# ------------------------------------------------------------------------------------------------------------

#                                                  Spoke 2

# ------------------------------------------------------------------------------------------------------------