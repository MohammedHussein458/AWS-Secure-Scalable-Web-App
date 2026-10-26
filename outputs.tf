output "vpc_id" {
  value = module.vpc.vpc_id
}

output "alb_dns_name" {
  description = "Open this in the browser"
  value       = module.alb.alb_dns_name
}

output "rds_endpoint" {
  value = module.database.endpoint
}

output "db_secret_arn" {
  description = "Secrets Manager secret that holds the DB master password"
  value       = module.database.master_secret_arn
}

output "nat_public_ips" {
  value = module.vpc.nat_public_ips
}

output "asg_name" {
  value = try(module.compute[0].asg_name, null)
}
