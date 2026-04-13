###############################
# Outputs du module VPC
###############################
output "vpc_id" {
  description = "ID du VPC créé"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "Liste des subnets publics"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "Liste des subnets privés"
  value       = module.vpc.private_subnets
}

###############################
# Outputs du module Compute
###############################
output "alb_dns_name" {
  description = "DNS du Load Balancer"
  value       = module.compute.alb_dns_name
}

###############################
# Outputs du module S3
###############################
output "logs_bucket" {
  description = "Bucket S3 contenant les logs"
  value       = module.s3.logs_bucket
}
