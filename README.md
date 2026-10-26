# Atlas - core infrastructure (Terraform)

    terraform init
    terraform plan
    terraform apply

Open the `alb_dns_name` output in the browser. Destroy everything with `terraform destroy`.

Flags in terraform.tfvars:
- enable_nat      : NAT gateways (cost while running)
- db_multi_az     : Multi-AZ RDS (double cost)
- enable_compute  : Launch Template + Auto Scaling Group (needs EC2 enabled on the account)
