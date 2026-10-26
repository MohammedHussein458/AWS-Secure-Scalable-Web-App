module "vpc" {
  source = "./modules/vpc"

  name                = var.project
  region              = var.region
  vpc_cidr            = var.vpc_cidr
  azs                 = var.azs
  public_subnet_cidrs = var.public_subnet_cidrs
  app_subnet_cidrs    = var.app_subnet_cidrs
  db_subnet_cidrs     = var.db_subnet_cidrs
  enable_nat          = var.enable_nat
}

module "security" {
  source = "./modules/security"

  name   = var.project
  vpc_id = module.vpc.vpc_id
}

module "database" {
  source = "./modules/database"

  name           = var.project
  db_subnet_ids  = module.vpc.db_subnet_ids
  db_sg_id       = module.security.db_sg_id
  instance_class = var.db_instance_class
  multi_az       = var.db_multi_az
}

module "alb" {
  source = "./modules/alb"

  name              = var.project
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_sg_id         = module.security.alb_sg_id
}

module "compute" {
  source = "./modules/compute"
  count  = var.enable_compute ? 1 : 0

  name             = var.project
  app_subnet_ids   = module.vpc.app_subnet_ids
  app_sg_id        = module.security.app_sg_id
  target_group_arn = module.alb.target_group_arn
  instance_type    = var.instance_type
}

module "monitoring" {
  source = "./modules/monitoring"

  name                   = var.project
  vpc_id                 = module.vpc.vpc_id
  db_identifier          = module.database.db_identifier
  alert_email            = var.alert_email
  enable_unhealthy_alarm = var.enable_compute
  alb_arn_suffix         = module.alb.alb_arn_suffix
  tg_arn_suffix          = module.alb.tg_arn_suffix
}
