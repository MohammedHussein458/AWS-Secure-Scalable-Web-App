variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "project" {
  description = "Name prefix for every resource (atlas-vpc, atlas-alb, ...)"
  type        = string
  default     = "atlas"
}

variable "vpc_cidr" {
  description = "CIDR block of the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "Two availability zones"
  type        = list(string)
  default     = ["eu-central-1a", "eu-central-1b"]
}

variable "public_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "app_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "db_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.21.0/24", "10.0.22.0/24"]
}

variable "enable_nat" {
  description = "Create one NAT gateway per AZ (costs money while running)"
  type        = bool
  default     = true
}

variable "db_instance_class" {
  type    = string
  default = "db.t3.micro"
}

variable "db_multi_az" {
  description = "Multi-AZ RDS (doubles the cost, not free tier)"
  type        = bool
  default     = false
}

variable "alert_email" {
  description = "Email that receives SNS alerts (empty = no subscription)"
  type        = string
  default     = ""
}

variable "enable_compute" {
  description = "Create the Launch Template + Auto Scaling Group (needs EC2 to be enabled on the account)"
  type        = bool
  default     = false
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}
